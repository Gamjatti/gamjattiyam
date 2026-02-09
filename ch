<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover" />
  <title>은행 회화 카드 반복학습</title>
  <style>
    :root{
      --bg:#0b0f14;
      --card:#121926;
      --card2:#0f1623;
      --text:#e8eef7;
      --muted:#a9b4c2;
      --accent:#7ee0ff;
      --good:#59d98e;
      --bad:#ff6b6b;
      --line:#263247;
      --shadow: 0 18px 50px rgba(0,0,0,.45);
      --radius: 18px;
      --pad: 16px;
    }
    *{box-sizing:border-box;}
    body{
      margin:0;
      background: radial-gradient(1200px 800px at 50% -20%, rgba(126,224,255,.12), transparent 55%),
                  radial-gradient(900px 700px at 90% 10%, rgba(89,217,142,.10), transparent 55%),
                  var(--bg);
      color:var(--text);
      font-family: system-ui, -apple-system, Segoe UI, Roboto, "Noto Sans KR", "Apple SD Gothic Neo", sans-serif;
      min-height:100vh;
      display:flex;
      justify-content:center;
    }
    .app{
      width:min(520px, 100%);
      padding: max(12px, env(safe-area-inset-top)) var(--pad) max(18px, env(safe-area-inset-bottom));
    }
    header{
      display:flex;
      align-items:flex-start;
      justify-content:space-between;
      gap:12px;
      margin: 10px 0 14px;
    }
    .title{
      display:flex;
      flex-direction:column;
      gap:6px;
    }
    .title h1{
      margin:0;
      font-size:18px;
      letter-spacing:-.2px;
    }
    .title .sub{
      color:var(--muted);
      font-size:12.5px;
      line-height:1.35;
    }
    .pill{
      border:1px solid var(--line);
      background: rgba(18,25,38,.55);
      border-radius:999px;
      padding:8px 10px;
      font-size:12px;
      color:var(--muted);
      display:flex;
      gap:8px;
      align-items:center;
      white-space:nowrap;
    }
    .pill b{color:var(--text); font-weight:600;}
    .progress{
      height:8px;
      background: rgba(38,50,71,.55);
      border-radius:999px;
      overflow:hidden;
      margin: 10px 0 14px;
      border:1px solid rgba(38,50,71,.6);
    }
    .bar{
      height:100%;
      width:0%;
      background: linear-gradient(90deg, rgba(126,224,255,.95), rgba(89,217,142,.95));
      transition: width .25s ease;
    }

    .cardWrap{
      perspective: 1200px;
      position:relative;
    }
    .card{
      background: linear-gradient(180deg, rgba(18,25,38,.95), rgba(15,22,35,.95));
      border: 1px solid rgba(38,50,71,.85);
      border-radius: var(--radius);
      box-shadow: var(--shadow);
      padding: 16px 16px 14px;
      min-height: 360px;
      transform-style: preserve-3d;
      transition: transform .45s cubic-bezier(.2,.75,.2,1);
      position:relative;
      overflow:hidden;
      user-select:none;
      -webkit-user-select:none;
      touch-action: pan-y;
    }
    .card::before{
      content:"";
      position:absolute;
      inset:-2px;
      background: radial-gradient(700px 400px at 20% 0%, rgba(126,224,255,.10), transparent 60%),
                  radial-gradient(700px 420px at 90% 20%, rgba(89,217,142,.08), transparent 60%);
      pointer-events:none;
    }
    .card.flipped{ transform: rotateY(180deg); }

    .face{
      position:absolute;
      inset:0;
      padding: 16px 16px 14px;
      backface-visibility:hidden;
      display:flex;
      flex-direction:column;
      gap:12px;
    }
    .front{ }
    .back{ transform: rotateY(180deg); }

    .meta{
      display:flex;
      justify-content:space-between;
      align-items:center;
      gap:10px;
      margin-bottom:2px;
    }
    .tag{
      display:inline-flex;
      gap:8px;
      align-items:center;
      padding: 6px 10px;
      border-radius:999px;
      border:1px solid rgba(38,50,71,.85);
      background: rgba(11,15,20,.35);
      color:var(--muted);
      font-size:12px;
    }
    .hint{
      font-size:12px;
      color:var(--muted);
      opacity:.95;
    }

    .textBlock{
      border-radius: 14px;
      border:1px solid rgba(38,50,71,.7);
      background: rgba(11,15,20,.25);
      padding: 12px 12px 10px;
      display:flex;
      flex-direction:column;
      gap:10px;
    }
    .zh{
      font-size:20px;
      line-height:1.35;
      letter-spacing:-.2px;
    }
    .py{
      font-size:14px;
      color: var(--accent);
      line-height:1.35;
      word-break:break-word;
    }
    .ko{
      font-size:14px;
      color: var(--text);
      opacity:.92;
      line-height:1.45;
    }

    .mini{
      display:flex;
      flex-wrap:wrap;
      gap:8px;
      margin-top:auto;
    }
    .chip{
      font-size:12px;
      color:var(--muted);
      border:1px solid rgba(38,50,71,.8);
      background: rgba(11,15,20,.18);
      padding: 7px 10px;
      border-radius: 999px;
    }

    .controls{
      display:grid;
      grid-template-columns: 1fr 1fr;
      gap:10px;
      margin: 12px 0 10px;
    }
    button{
      border:1px solid rgba(38,50,71,.9);
      background: rgba(18,25,38,.6);
      color: var(--text);
      padding: 12px 12px;
      border-radius: 14px;
      font-size: 14px;
      font-weight: 600;
      letter-spacing:-.1px;
      box-shadow: 0 10px 28px rgba(0,0,0,.28);
      cursor:pointer;
      touch-action: manipulation;
    }
    button:active{ transform: translateY(1px); }

    .row{
      display:grid;
      grid-template-columns: 1.2fr 1fr 1fr;
      gap:10px;
      margin-top: 10px;
    }
    .small{
      font-size:13px;
      font-weight:600;
      padding: 11px 12px;
      border-radius: 14px;
    }
    .good{ border-color: rgba(89,217,142,.65); }
    .bad{ border-color: rgba(255,107,107,.65); }
    .ghost{ opacity:.9; }

    .toolbar{
      display:flex;
      gap:10px;
      margin-top: 10px;
    }
    .toggle{
      flex:1;
      display:flex;
      align-items:center;
      justify-content:space-between;
      gap:12px;
      border:1px solid rgba(38,50,71,.85);
      background: rgba(18,25,38,.5);
      border-radius: 14px;
      padding: 10px 12px;
      color: var(--muted);
      font-size: 13px;
    }
    .toggle input{ transform: scale(1.1); }

    .footer{
      margin-top: 12px;
      color: var(--muted);
      font-size: 12px;
      line-height:1.4;
      opacity:.9;
    }

    .toast{
      position:fixed;
      left:50%;
      bottom: max(16px, env(safe-area-inset-bottom));
      transform: translateX(-50%);
      background: rgba(18,25,38,.92);
      border:1px solid rgba(38,50,71,.9);
      padding: 10px 12px;
      border-radius: 999px;
      font-size: 12.5px;
      color: var(--text);
      box-shadow: var(--shadow);
      opacity:0;
      pointer-events:none;
      transition: opacity .22s ease, transform .22s ease;
    }
    .toast.show{
      opacity:1;
      transform: translateX(-50%) translateY(-6px);
    }
  </style>
</head>
<body>
  <div class="app">
    <header>
      <div class="title">
        <h1>🏦 은행 회화 — 카드 반복학습</h1>
        <div class="sub">카드를 탭하면 뒤집혀요. 좌/우 스와이프로 넘기기 가능. “모름” 표시한 카드가 더 자주 나옵니다.</div>
      </div>
      <div class="pill"><span>진행</span><b id="pos">1</b><span>/</span><span id="total">0</span></div>
    </header>

    <div class="progress"><div class="bar" id="bar"></div></div>

    <div class="cardWrap">
      <div class="card" id="card" role="button" aria-label="학습 카드">
        <!-- FRONT -->
        <div class="face front">
          <div class="meta">
            <div class="tag">앞면 · 중국어</div>
            <div class="hint">탭: 뜻/병음 보기</div>
          </div>
          <div class="textBlock">
            <div class="zh" id="frontZh">—</div>
          </div>
          <div class="mini" id="frontChips"></div>
        </div>

        <!-- BACK -->
        <div class="face back">
          <div class="meta">
            <div class="tag">뒷면 · 병음/뜻</div>
            <div class="hint">탭: 다시 중국어</div>
          </div>
          <div class="textBlock">
            <div class="zh" id="backZh">—</div>
            <div class="py" id="backPy">—</div>
            <div class="ko" id="backKo">—</div>
          </div>
          <div class="mini" id="backChips"></div>
        </div>
      </div>
    </div>

    <div class="controls">
      <button id="flipBtn">카드 뒤집기 (Tap)</button>
      <button id="nextBtn">다음 카드 (→)</button>
    </div>

    <div class="row">
      <button class="small bad" id="againBtn">모름 · 다시</button>
      <button class="small good" id="goodBtn">앎 · 통과</button>
      <button class="small ghost" id="shuffleBtn">셔플</button>
    </div>

    <div class="toolbar">
      <label class="toggle">
        <span>자동재생 (3초)</span>
        <input type="checkbox" id="autoPlay" />
      </label>
      <label class="toggle">
        <span>모름 우선</span>
        <input type="checkbox" id="unknownFirst" checked />
      </label>
    </div>

    <div class="footer">
      ✅ 팁: “모름” 누른 문장은 반복 큐에 더 많이 들어가요. <br/>
      ⌨️ 키보드: Space(뒤집기), →(다음), 1(모름), 2(앎)
    </div>
  </div>

  <div class="toast" id="toast">저장됨</div>

<script>
/**
 * 데이터: (중문 / 병음 / 뜻 / 태그)
 * 원문에서 핵심 문장들로 카드화
 */
const CARDS = [
  { zh:"今天上午，小丽去银行取钱。", py:"Jīntiān shàngwǔ, Xiǎolì qù yínháng qǔ qián.", ko:"오늘 오전, 샤오리는 은행에 돈을 찾으러 갔다.", tags:["상황","은행"] },
  { zh:"银行里人不多，很安静。", py:"Yínháng lǐ rén bú duō, hěn ānjìng.", ko:"은행 안에는 사람이 많지 않아 조용했다.", tags:["상황"] },
  { zh:"她拿着银行卡，排队等候。", py:"Tā názhe yínhángkǎ, páiduì děnghòu.", ko:"그녀는 은행카드를 들고 줄을 서서 기다렸다.", tags:["동작","필수표현"] },
  { zh:"轮到小丽了，她走到窗口前。", py:"Lúndào Xiǎolì le, tā zǒu dào chuāngkǒu qián.", ko:"샤오리 차례가 되자 창구 앞으로 갔다.", tags:["상황"] },

  { zh:"你好，请问你要办什么？", py:"Nǐhǎo, qǐngwèn nǐ yào bàn shénme?", ko:"안녕하세요, 무엇을 도와드릴까요?", tags:["직원","자주씀"] },
  { zh:"你好，我想取钱。", py:"Nǐhǎo, wǒ xiǎng qǔ qián.", ko:"안녕하세요, 돈을 찾고 싶어요.", tags:["손님","자주씀"] },
  { zh:"好的，请给我你的银行卡。", py:"Hǎo de, qǐng gěi wǒ nǐ de yínhángkǎ.", ko:"네, 은행카드를 주세요.", tags:["직원"] },
  { zh:"好的，在这里。", py:"Hǎo de, zài zhèlǐ.", ko:"네, 여기요.", tags:["손님"] },
  { zh:"你要取多少钱？", py:"Nǐ yào qǔ duōshao qián?", ko:"얼마를 찾으실 건가요?", tags:["직원","금액"] },
  { zh:"取五千块。", py:"Qǔ wǔqiān kuài.", ko:"5천 위안을 찾을게요.", tags:["손님","금액"] },

  { zh:"请问要现金还是转账？", py:"Qǐngwèn yào xiànjīn háishi zhuǎnzhàng?", ko:"현금으로 드릴까요, 이체로 해드릴까요?", tags:["직원","선택"] },
  { zh:"要现金。", py:"Yào xiànjīn.", ko:"현금으로요.", tags:["손님"] },
  { zh:"好的，请输入密码。", py:"Hǎo de, qǐng shūrù mìmǎ.", ko:"네, 비밀번호를 입력해주세요.", tags:["직원","필수표현"] },
  { zh:"请稍等一下。", py:"Qǐng shāoděng yíxià.", ko:"잠시만 기다려주세요.", tags:["직원","자주씀"] },

  { zh:"这是你的钱，请点一下。", py:"Zhè shì nǐ de qián, qǐng diǎn yíxià.", ko:"여기 돈입니다. 한번 세어보세요.", tags:["직원","필수표현"] },
  { zh:"对的，一共五千块。", py:"Duì de, yígòng wǔqiān kuài.", ko:"맞아요, 총 5천 위안이에요.", tags:["확인","금액"] },
  { zh:"这是你的银行卡和收据。", py:"Zhè shì nǐ de yínhángkǎ hé shōujù.", ko:"여기 은행카드와 영수증입니다.", tags:["직원"] },
  { zh:"不客气。", py:"Bú kèqi.", ko:"천만에요.", tags:["매너"] },

  { zh:"不好意思，我可以顺便问一下吗？", py:"Bùhǎoyìsi, wǒ kěyǐ shùnbiàn wèn yíxià ma?", ko:"죄송한데, 겸사겸사 하나 물어봐도 될까요?", tags:["추가질문","매너"] },
  { zh:"如果银行卡丢了，怎么办？", py:"Rúguǒ yínhángkǎ diū le, zěnme bàn?", ko:"만약 은행카드를 잃어버리면 어떻게 하나요?", tags:["문제상황"] },
  { zh:"可以先挂失，然后再补办一张新卡。", py:"Kěyǐ xiān guàshī, ránhòu zài bǔbàn yì zhāng xīn kǎ.", ko:"먼저 분실신고를 하고, 그 다음 새 카드를 재발급하면 됩니다.", tags:["해결","은행"] },
  { zh:"明白了，谢谢你。", py:"Míngbai le, xièxie nǐ.", ko:"알겠습니다, 감사합니다.", tags:["마무리"] },

  { zh:"今天的事情办得很顺利，她觉得很舒心。", py:"Jīntiān de shìqing bàn de hěn shùnlì, tā juéde hěn shūxīn.", ko:"오늘 일이 아주 순조롭게 처리되어 마음이 편안했다.", tags:["마무리","상황"] },
];

// --------- 간단 SRS(가중치) ---------
const state = {
  deck: CARDS.map((c, i)=>({ ...c, id:i, // weight가 높을수록 더 자주
    weight: 1, seen:0, known:0, unknown:0
  })),
  order: [],
  idx: 0,
  flipped: false,
  autoplay: false,
  unknownFirst: true,
  timer: null,
};

const el = (id)=>document.getElementById(id);
const cardEl = el("card");
const frontZh = el("frontZh");
const backZh  = el("backZh");
const backPy  = el("backPy");
const backKo  = el("backKo");
const posEl   = el("pos");
const totalEl = el("total");
const barEl   = el("bar");
const toastEl = el("toast");

const frontChips = el("frontChips");
const backChips  = el("backChips");

function showToast(msg){
  toastEl.textContent = msg;
  toastEl.classList.add("show");
  setTimeout(()=>toastEl.classList.remove("show"), 800);
}

function buildOrder(){
  // 가중치 기반 샘플링으로 200장의 “학습 큐” 생성
  const pool = [];
  for(const c of state.deck){
    let w = Math.max(1, Math.round(c.weight));
    // 모름 우선 옵션이면 unknown 많은 카드 가중치 추가
    if(state.unknownFirst){
      w += Math.min(6, c.unknown);
    }
    for(let k=0;k<w;k++) pool.push(c.id);
  }
  // 섞고 200개 뽑기(중복 허용) → 반복학습 느낌
  const order = [];
  for(let i=0;i<200;i++){
    order.push(pool[Math.floor(Math.random()*pool.length)]);
  }
  state.order = order;
  state.idx = 0;
}

function currentCard(){
  const id = state.order[state.idx];
  return state.deck[id];
}

function render(){
  const c = currentCard();
  // front
  frontZh.textContent = c.zh;
  // back
  backZh.textContent = c.zh;
  backPy.textContent = c.py;
  backKo.textContent = c.ko;

  // chips
  const chips = (tags)=> tags.map(t=>`<span class="chip">${t}</span>`).join("");
  frontChips.innerHTML = chips(c.tags || []);
  backChips.innerHTML  = chips([
    `본 횟수 ${c.seen}`,
    `앎 ${c.known}`,
    `모름 ${c.unknown}`
  ]);

  totalEl.textContent = state.order.length;
  posEl.textContent = (state.idx + 1);

  const pct = ((state.idx+1)/state.order.length)*100;
  barEl.style.width = `${pct}%`;

  // flip reset
  if(state.flipped){
    state.flipped = false;
    cardEl.classList.remove("flipped");
  }
}

function flip(){
  state.flipped = !state.flipped;
  cardEl.classList.toggle("flipped", state.flipped);
}

function next(){
  state.idx = (state.idx + 1) % state.order.length;
  render();
}

function markAgain(){
  const c = currentCard();
  c.seen += 1;
  c.unknown += 1;
  c.weight = Math.min(12, c.weight + 2); // 모르면 더 자주
  showToast("모름 ✅ (더 자주 나옴)");
  next();
}

function markGood(){
  const c = currentCard();
  c.seen += 1;
  c.known += 1;
  c.weight = Math.max(1, c.weight - 1); // 알면 덜 자주
  showToast("앎 ✅ (덜 나옴)");
  next();
}

function shuffle(){
  buildOrder();
  render();
  showToast("셔플 완료");
}

function setAutoplay(on){
  state.autoplay = on;
  if(state.timer) clearInterval(state.timer);
  state.timer = null;
  if(on){
    state.timer = setInterval(()=> {
      // 앞면이면 뒤집고, 이미 뒷면이면 다음
      if(!state.flipped) flip();
      else next();
    }, 3000);
  }
}

// --------- 이벤트 바인딩 ---------
el("flipBtn").addEventListener("click", flip);
el("nextBtn").addEventListener("click", next);
el("againBtn").addEventListener("click", markAgain);
el("goodBtn").addEventListener("click", markGood);
el("shuffleBtn").addEventListener("click", shuffle);

cardEl.addEventListener("click", flip);

el("autoPlay").addEventListener("change", (e)=> setAutoplay(e.target.checked));
el("unknownFirst").addEventListener("change", (e)=> {
  state.unknownFirst = e.target.checked;
  shuffle();
});

// 키보드 단축키
window.addEventListener("keydown", (e)=>{
  if(e.code === "Space"){ e.preventDefault(); flip(); }
  if(e.code === "ArrowRight"){ next(); }
  if(e.key === "1"){ markAgain(); }
  if(e.key === "2"){ markGood(); }
});

// 스와이프(좌/우)
let touchStartX = null, touchStartY = null, moved = false;
cardEl.addEventListener("touchstart", (e)=>{
  const t = e.touches[0];
  touchStartX = t.clientX;
  touchStartY = t.clientY;
  moved = false;
}, {passive:true});

cardEl.addEventListener("touchmove", (e)=>{
  if(touchStartX == null) return;
  const t = e.touches[0];
  const dx = t.clientX - touchStartX;
  const dy = t.clientY - touchStartY;
  if(Math.abs(dx) > 18 && Math.abs(dx) > Math.abs(dy)) moved = true;
}, {passive:true});

cardEl.addEventListener("touchend", (e)=>{
  if(touchStartX == null) return;
  const t = e.changedTouches[0];
  const dx = t.clientX - touchStartX;
  touchStartX = null; touchStartY = null;

  if(!moved){
    // 탭으로 간주 → 뒤집기
    flip();
    return;
  }
  if(dx < -40){ // 왼쪽으로 밀기 → 다음
    next();
  }else if(dx > 40){ // 오른쪽으로 밀기 → 뒤집기(또는 이전을 원하면 여기 수정)
    flip();
  }
});

// 초기
buildOrder();
render();
</script>
</body>
</html>
