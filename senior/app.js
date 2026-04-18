(async () => {
  const data = await fetch("data.json").then((r) => r.json());
  if (!data.dates || data.dates.length === 0) {
    document.getElementById("ideas-grid").innerHTML =
      '<div class="empty">리포트가 없습니다.</div>';
    return;
  }

  const CAT_ICONS = { health: "🏥", money: "💰", travel: "✈️", digital: "📱", other: "📌" };
  const CAT_LABELS = { health: "건강", money: "돈", travel: "여행", digital: "디지털", other: "기타" };

  const state = {
    category: "all",
    difficulty: "all",
    potential: "all",
    query: "",
    sort: "recent",
  };

  const madeIds = new Set(JSON.parse(localStorage.getItem("madeIds") || "[]"));

  const todayDate = data.dates[0];
  const todayReport = data.reports[todayDate];

  document.getElementById("today-date").textContent = todayDate;
  document.getElementById("today-summary").innerHTML = sanitize(
    todayReport.summary_html || esc(todayReport.summary || "")
  );

  // TOP 3
  const heroCards = document.getElementById("hero-cards");
  (todayReport.ideas || []).slice(0, 3).forEach((idea, i) => {
    const el = document.createElement("a");
    el.className = "top-card";
    el.href = `reports/${todayDate}.html#idea-${idea.rank}`;
    el.innerHTML = `
      <div class="rank">TOP ${i + 1}</div>
      <div class="title">${esc(idea.title)}</div>
      <div class="meta">${CAT_ICONS[idea.category] || "📌"} ${CAT_LABELS[idea.category] || "기타"} · 난이도 ${esc(idea.difficulty_label || "-")} · 잠재력 ${esc(idea.potential_label || "-")}</div>
    `;
    heroCards.appendChild(el);
  });

  // Flatten all ideas
  const allIdeas = [];
  data.dates.forEach((d) => {
    (data.reports[d].ideas || []).forEach((idea) => {
      allIdeas.push({ ...idea, date: d, id: `${d}-${idea.rank}` });
    });
  });

  // Filter clicks
  document.querySelectorAll("[data-filter]").forEach((el) => {
    el.addEventListener("click", () => {
      const key = el.dataset.filter;
      const val = el.dataset.value;
      state[key] = val;
      document
        .querySelectorAll(`[data-filter="${key}"]`)
        .forEach((b) => b.classList.toggle("active", b.dataset.value === val));
      render();
    });
  });

  document.getElementById("search").addEventListener("input", (e) => {
    state.query = e.target.value.trim().toLowerCase();
    render();
  });
  document.getElementById("sort").addEventListener("change", (e) => {
    state.sort = e.target.value;
    render();
  });

  function render() {
    let items = allIdeas.slice();
    if (state.category !== "all") items = items.filter((i) => i.category === state.category);
    if (state.difficulty !== "all") items = items.filter((i) => i.difficulty === state.difficulty);
    if (state.potential !== "all") items = items.filter((i) => i.potential === state.potential);
    if (state.query) {
      items = items.filter(
        (i) =>
          (i.title || "").toLowerCase().includes(state.query) ||
          (i.channels || "").toLowerCase().includes(state.query) ||
          (i.script_points || []).join(" ").toLowerCase().includes(state.query) ||
          (i.target_age || "").toLowerCase().includes(state.query)
      );
    }

    if (state.sort === "recent") {
      items.sort((a, b) => b.date.localeCompare(a.date) || a.rank - b.rank);
    } else if (state.sort === "potential") {
      items.sort((a, b) => potRank(b.potential) - potRank(a.potential) || b.date.localeCompare(a.date));
    } else if (state.sort === "easy") {
      items.sort((a, b) => diffRank(a.difficulty) - diffRank(b.difficulty) || b.date.localeCompare(a.date));
    }

    const grid = document.getElementById("ideas-grid");
    grid.innerHTML = "";
    document.getElementById("result-count").textContent = `${items.length}개`;
    if (items.length === 0) {
      grid.innerHTML = '<div class="empty">해당 조건의 아이디어가 없습니다.</div>';
      return;
    }
    items.forEach((idea) => {
      const made = madeIds.has(idea.id);
      const card = document.createElement("div");
      card.className = "idea-card" + (made ? " made" : "");
      card.innerHTML = `
        <div class="idea-head">
          <span class="idea-cat">${CAT_ICONS[idea.category] || "📌"} ${CAT_LABELS[idea.category] || "기타"}</span>
          <span class="idea-date">${idea.date === todayDate ? '<span class="today-tag">오늘</span>' : ""}${idea.date}</span>
        </div>
        <h3 class="idea-title">${esc(idea.title)}</h3>
        <div class="idea-meta">
          <span class="badge ${idea.difficulty}">🛠 ${esc(idea.difficulty_label || "-")}</span>
          <span class="badge ${idea.potential}">🔥 ${esc(idea.potential_label || "-")}</span>
          ${idea.target_age ? `<span class="badge">👥 ${esc(truncate(idea.target_age, 24))}</span>` : ""}
        </div>
        <div class="idea-actions">
          <a class="btn primary" href="reports/${idea.date}.html#idea-${idea.rank}">📄 상세</a>
          <button class="btn made-toggle" data-id="${idea.id}">${made ? "↩ 취소" : "✓ 만들었음"}</button>
        </div>
      `;
      grid.appendChild(card);
    });

    grid.querySelectorAll(".made-toggle").forEach((btn) => {
      btn.addEventListener("click", (e) => {
        e.stopPropagation();
        const id = btn.dataset.id;
        if (madeIds.has(id)) madeIds.delete(id);
        else madeIds.add(id);
        localStorage.setItem("madeIds", JSON.stringify([...madeIds]));
        render();
      });
    });
  }

  function potRank(p) { return { high: 3, medium: 2, low: 1 }[p] || 0; }
  function diffRank(d) { return { easy: 1, medium: 2, hard: 3 }[d] || 2; }
  function esc(s) {
    return String(s).replace(/[&<>"']/g, (c) => ({
      "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;"
    }[c]));
  }
  function truncate(s, n) { return s.length > n ? s.slice(0, n) + "…" : s; }

  // Allowlist-based sanitizer: permits <strong>, <em>, <code>, <br>, <a>, <ul>, <li>.
  function sanitize(dirty) {
    const tpl = document.createElement("template");
    tpl.innerHTML = String(dirty);
    const ALLOWED = new Set(["STRONG", "B", "EM", "I", "CODE", "BR", "A", "UL", "LI"]);
    const ALLOWED_ATTRS = { A: new Set(["href", "target", "rel"]) };
    function walk(node) {
      [...node.childNodes].forEach((n) => {
        if (n.nodeType === 1) {
          if (!ALLOWED.has(n.tagName)) {
            const text = document.createTextNode(n.textContent);
            n.replaceWith(text);
            return;
          }
          const allowed = ALLOWED_ATTRS[n.tagName] || new Set();
          [...n.attributes].forEach((a) => {
            if (!allowed.has(a.name)) n.removeAttribute(a.name);
          });
          if (n.tagName === "A") {
            const href = n.getAttribute("href") || "";
            if (!/^(https?:|\/|#|mailto:)/i.test(href)) n.removeAttribute("href");
            n.setAttribute("target", "_blank");
            n.setAttribute("rel", "noopener noreferrer");
          }
          walk(n);
        } else if (n.nodeType !== 3) {
          n.remove();
        }
      });
    }
    walk(tpl.content);
    const div = document.createElement("div");
    div.appendChild(tpl.content);
    return div.innerHTML;
  }

  render();

  // Archive
  const archive = document.getElementById("archive-list");
  data.dates.forEach((d) => {
    const report = data.reports[d];
    const det = document.createElement("details");
    det.innerHTML = `
      <summary>${d === todayDate ? '<span class="today-tag">오늘</span>' : ""}${d} — ${esc(truncate(report.summary || "(요약 없음)", 70))}</summary>
      <div class="inner">
        <a href="reports/${d}.html">📖 풀 리포트 보기 →</a>
      </div>
    `;
    archive.appendChild(det);
  });
})();
