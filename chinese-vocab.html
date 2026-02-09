<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>중국어 단어 학습</title>
  <style>
    * { margin:0; padding:0; box-sizing:border-box; }
    body{
      font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,'Helvetica Neue',Arial,sans-serif;
      background:linear-gradient(135deg,#e0f2e9 0%,#d4e7f7 100%);
      min-height:100vh;
      display:flex; align-items:center; justify-content:center;
      padding:20px;
    }
    .container{ width:100%; max-width:800px; }
    .progress-section{ margin-bottom:20px; }
    .progress-header{
      display:flex; justify-content:space-between; align-items:center;
      margin-bottom:10px; gap:12px;
    }
    .progress-text{ font-size:14px; font-weight:600; color:#555; }
    .stats{ display:flex; gap:15px; align-items:center; flex-wrap:wrap; }
    .stat-correct{ color:#22c55e; font-size:14px; }
    .stat-incorrect{ color:#ef4444; font-size:14px; }
    .stat-voice{ color:#3b82f6; font-size:14px; font-weight:700; }
    .reset-btn{
      background:none; border:none; color:#888; cursor:pointer;
      font-size:18px; padding:5px; transition:color .3s;
    }
    .reset-btn:hover{ color:#555; }
    .progress-bar{
      width:100%; height:8px; background:#ddd; border-radius:10px; overflow:hidden;
    }
    .progress-fill{
      height:100%;
      background:linear-gradient(90deg,#22c55e 0%,#3b82f6 100%);
      transition:width .5s ease;
    }
    .review-notice{ margin-top:8px; font-size:13px; color:#f97316; }
    .card-container{
      background:white; border-radius:20px;
      box-shadow:0 10px 40px rgba(0,0,0,0.1);
      padding:40px;
    }
    .question-section{
      text-align:center; margin-bottom:40px; padding-bottom:30px;
      border-bottom:2px solid #f0f0f0;
    }
    .chinese-word{ font-size:72px; font-weight:bold; color:#333; margin-bottom:15px; }
    .pinyin{ font-size:28px; color:#888; margin-bottom:25px; }

    .pronunciation-btn{
      background:#3b82f6; color:white; border:none;
      padding:12px 24px; border-radius:50px;
      font-size:16px; font-weight:700; cursor:pointer;
      display:inline-flex; align-items:center; gap:8px;
      box-shadow:0 4px 12px rgba(59,130,246,0.3);
      transition:all .3s;
    }
    .pronunciation-btn:hover{
      background:#2563eb;
      transform:translateY(-2px);
      box-shadow:0 6px 16px rgba(59,130,246,0.4);
    }
    .pronunciation-btn:disabled{
      opacity:.65;
      cursor:not-allowed;
      transform:none;
    }
    .pronunciation-btn.playing{ animation:pulse 1s infinite; }
    @keyframes pulse{ 0%,100%{opacity:1} 50%{opacity:.7} }

    .answer-section{ margin-top:30px; }
    .question-prompt{
      text-align:center; color:#666; font-weight:700;
      margin-bottom:20px; font-size:16px;
    }
    .options{ display:grid; gap:12px; }
    .option-btn{
      padding:20px; border-radius:12px; font-size:18px; font-weight:700;
      cursor:pointer; transition:all .3s;
      text-align:left; border:2px solid #ddd; background:white;
      display:flex; justify-content:space-between; align-items:center;
    }
    .option-btn:hover:not(:disabled){
      background:#eff6ff;
      border-color:#3b82f6;
    }
    .option-btn.correct{ background:#22c55e; color:white; border-color:#16a34a; }
    .option-btn.incorrect{ background:#ef4444; color:white; border-color:#dc2626; }
    .option-btn.disabled{ background:#f5f5f5; opacity:.5; cursor:not-allowed; }
    .option-text{ white-space:pre-line; }
    .icon{ font-size:24px; }

    .result-message{
      margin-top:25px; padding:16px; border-radius:12px;
      text-align:center; font-weight:800; font-size:16px;
    }
    .result-message.correct{ background:#dcfce7; color:#166534; }
    .result-message.incorrect{ background:#fee2e2; color:#991b1b; }

    .hint{ text-align:center; color:#888; font-size:14px; margin-top:30px; }

    .toast{
      position:fixed;
      left:50%;
      bottom:18px;
      transform:translateX(-50%);
      background:rgba(0,0,0,.75);
      color:white;
      padding:10px 14px;
      border-radius:12px;
      font-size:13px;
      opacity:0;
      pointer-events:none;
      transition:opacity .18s ease;
      max-width:min(720px, calc(100% - 24px));
      text-align:center;
      line-height:1.35;
    }
    .toast.show{ opacity:1; }

    .completion-screen{
      background:white; border-radius:20px;
      box-shadow:0 10px 40px rgba(0,0,0,0.1);
      padding:50px; text-align:center;
      max-width:500px; margin:0 auto;
    }
    .completion-emoji{ font-size:80px; margin-bottom:20px; }
    .completion-title{ font-size:32px; font-weight:900; color:#333; margin-bottom:30px; }
    .completion-stats{ background:#f9fafb; border-radius:12px; padding:25px; margin-bottom:30px; }
    .completion-stat{ color:#666; margin-bottom:10px; font-size:16px; }
    .completion-stat:last-child{ margin-bottom:0; }
    .stat-value{ font-weight:900; font-size:20px; }
    .stat-value.correct{ color:#22c55e; }
    .stat-value.incorrect{ color:#ef4444; }
    .stat-value.rate{ color:#3b82f6; }
    .restart-btn{
      background:linear-gradient(90deg,#22c55e 0%,#3b82f6 100%);
      color:white; border:none;
      padding:15px 30px; border-radius:12px;
      font-size:16px; font-weight:800; cursor:pointer;
      width:100%;
      display:flex; align-items:center; justify-content:center; gap:10px;
      box-shadow:0 4px 12px rgba(0,0,0,0.1);
      transition:all .3s;
    }
    .restart-btn:hover{ transform:translateY(-2px); box-shadow:0 6px 16px rgba(0,0,0,0.15); }

    @media (max-width:640px){
      .chinese-word{ font-size:56px; }
      .pinyin{ font-size:22px; }
      .card-container{ padding:25px; }
      .option-btn{ font-size:16px; padding:16px; }
    }
  </style>
</head>

<body>
  <div class="container" id="app"></div>
  <div class="toast" id="toast"></div>

  <script>
    const vocabulary = [
      { id:'anquan',  chinese:'安全', pinyin:'ānquán',  korean:'안전하다' },
      { id:'kunnan',  chinese:'困难', pinyin:'kùnnan',  korean:'어려움, 곤란\n곤란하다, 어렵다' },
      { id:'biaoshi', chinese:'表示', pinyin:'biǎoshì', korean:'① 표명하다, 나타내다\n② 의미하다, 가리키다' },
      { id:'cuowu',   chinese:'错误', pinyin:'cuòwù',   korean:'잘못, 착오\n잘못되다, 부정확하다' },
      { id:'jiaoyu',  chinese:'教育', pinyin:'jiàoyù',  korean:'교육하다\n교육' },
      { id:'biru',    chinese:'比如', pinyin:'bǐrú',    korean:'예를 들다' },
      { id:'anshi',   chinese:'按时', pinyin:'ànshí',   korean:'제시간에, 시간에 맞추어' },
      { id:'tongguo', chinese:'通过', pinyin:'tōngguò', korean:'통과하다\n~을 통해' },
      { id:'yinqi',   chinese:'引起', pinyin:'yǐnqǐ',   korean:'불러일으키다, (주의를) 끌다, 야기하다' },
      { id:'yan',     chinese:'盐',   pinyin:'yán',     korean:'소금' },
      { id:'senlin',  chinese:'森林', pinyin:'sēnlín',  korean:'삼림, 숲' },
      { id:'yuedu',   chinese:'阅读', pinyin:'yuèdú',   korean:'읽고 이해하다' },
      { id:'shou',    chinese:'收',   pinyin:'shōu',    korean:'받다' },
      { id:'yonggan', chinese:'勇敢', pinyin:'yǒnggǎn', korean:'용감하다' },
      { id:'xianjin', chinese:'现金', pinyin:'xiànjīn', korean:'현금' },
      { id:'youqi',   chinese:'尤其', pinyin:'yóuqí',   korean:'더욱이, 특히' }
    ];

    let cards = [];
    let currentIndex = 0;
    let options = [];
    let selectedAnswer = null;
    let showResult = false;
    let stats = { correct: 0, incorrect: 0 };
    let isPlaying = false;
    const mastered = new Set();

    const toastEl = document.getElementById("toast");
    function toast(msg){
      toastEl.textContent = msg;
      toastEl.classList.add("show");
      setTimeout(()=>toastEl.classList.remove("show"), 1600);
    }

    // ====== ✅ 핵심: 중국어 음성 선택을 "강제"로 최대한 정확하게 ======
    // 1순위: zh-CN
    // 2순위: zh-Hans
    // 3순위: zh-TW / zh-HK
    // 4순위: name에 Chinese/Mandarin 포함
    function pickChineseVoice(voices){
      if(!voices || voices.length === 0) return null;

      const byLangExact = (lang) => voices.find(v => (v.lang || "").toLowerCase() === lang);
      const byLangStart = (prefix) => voices.find(v => (v.lang || "").toLowerCase().startsWith(prefix));

      return (
        byLangExact("zh-cn") ||
        byLangExact("zh-hans-cn") ||
        byLangStart("zh-cn") ||
        byLangStart("zh-hans") ||
        byLangExact("zh-tw") ||
        byLangExact("zh-hk") ||
        byLangStart("zh") ||
        voices.find(v => /mandarin|chinese|zh/i.test(v.name || "")) ||
        null
      );
    }

    // 음성 목록 로딩을 확실히 기다리는 함수
    function getVoicesReady(){
      return new Promise((resolve) => {
        const synth = window.speechSynthesis;
        if(!synth) return resolve([]);

        let voices = synth.getVoices();
        if(voices && voices.length) return resolve(voices);

        // voices가 비어있으면 이벤트를 기다림
        const timer = setTimeout(() => {
          resolve(synth.getVoices() || []);
        }, 1200);

        synth.onvoiceschanged = () => {
          clearTimeout(timer);
          synth.onvoiceschanged = null;
          resolve(synth.getVoices() || []);
        };
      });
    }

    async function playPronunciation(text) {
      if (!("speechSynthesis" in window)) {
        toast("이 브라우저는 음성 기능이 지원되지 않아요 😭");
        return;
      }

      const synth = window.speechSynthesis;
      synth.cancel();

      const voices = await getVoicesReady();
      const voice = pickChineseVoice(voices);

      if(!voice){
        // ✅ 중국어 보이스 자체가 없는 경우: 이건 코드로 해결 불가
        toast("⚠️ 이 기기/브라우저에 중국어 음성이 없어요. (중국어 TTS 설치 필요)");
        return;
      }

      isPlaying = true;
      render();

      const utterance = new SpeechSynthesisUtterance(text);

      utterance.voice = voice;
      utterance.lang = voice.lang || "zh-CN";
      utterance.rate = 0.78;
      utterance.pitch = 1.0;
      utterance.volume = 1.0;

      utterance.onend = () => { isPlaying = false; render(); };
      utterance.onerror = () => { isPlaying = false; render(); };

      synth.speak(utterance);
    }

    function init() {
      cards = vocabulary.map(v => ({
        ...v,
        reviewed: false,
        understood: null,
        isReview: false
      }));
      currentIndex = 0;
      selectedAnswer = null;
      showResult = false;
      stats = { correct: 0, incorrect: 0 };
      mastered.clear();
      generateOptions();
      render();
    }

    function generateOptions() {
      const currentCard = cards[currentIndex];
      if (!currentCard) return;

      const correctAnswer = currentCard.korean;

      const wrongAnswers = vocabulary
        .filter(v => v.korean !== correctAnswer)
        .sort(() => Math.random() - 0.5)
        .slice(0, 3)
        .map(v => v.korean);

      options = [correctAnswer, ...wrongAnswers].sort(() => Math.random() - 0.5);
    }

    function handleAnswer(optionIndex) {
      if (showResult) return;

      const currentCard = cards[currentIndex];
      if (!currentCard) return;

      const answer = options[optionIndex];
      selectedAnswer = answer;
      showResult = true;

      const isCorrect = answer === currentCard.korean;

      cards[currentIndex] = {
        ...currentCard,
        reviewed: true,
        understood: isCorrect
      };

      if (isCorrect) {
        stats.correct += 1;
        mastered.add(currentCard.id);
      } else {
        stats.incorrect += 1;

        cards.push({
          ...currentCard,
          reviewed: false,
          understood: null,
          isReview: true
        });
      }

      render();

      setTimeout(() => {
        if (currentIndex < cards.length - 1) {
          currentIndex++;
          selectedAnswer = null;
          showResult = false;
          generateOptions();
          render();
        } else {
          render();
        }
      }, 1100);
    }

    function reset() {
      window.speechSynthesis?.cancel?.();
      init();
    }

    function getButtonClass(option) {
      if (!showResult) return 'option-btn';

      const currentCard = cards[currentIndex];
      if (!currentCard) return 'option-btn';

      if (option === currentCard.korean) return 'option-btn correct';
      if (option === selectedAnswer && option !== currentCard.korean) return 'option-btn incorrect';
      return 'option-btn disabled';
    }

    function escapeHtml(text) {
      const div = document.createElement('div');
      div.textContent = text;
      return div.innerHTML;
    }

    function render() {
      const app = document.getElementById('app');
      const currentCard = cards[currentIndex];

      const masteredCount = mastered.size;
      const notUnderstoodCount = cards.filter(c => c.reviewed && c.understood === false).length;

      if (!currentCard) {
        const total = stats.correct + stats.incorrect;
        const accuracy = total === 0 ? 0 : Math.round((stats.correct / total) * 100);

        app.innerHTML =
          '<div class="completion-screen">' +
            '<div class="completion-emoji">🎉</div>' +
            '<h2 class="completion-title">학습 완료!</h2>' +
            '<div class="completion-stats">' +
              '<p class="completion-stat">정답: <span class="stat-value correct">' + stats.correct + '</span></p>' +
              '<p class="completion-stat">오답: <span class="stat-value incorrect">' + stats.incorrect + '</span></p>' +
              '<p class="completion-stat">정답률: <span class="stat-value rate">' + accuracy + '%</span></p>' +
            '</div>' +
            '<button class="restart-btn" id="restartBtn"><span>🔄</span> 다시 시작하기</button>' +
          '</div>';

        document.getElementById('restartBtn').addEventListener('click', reset);
        return;
      }

      const progressPercent = (masteredCount / vocabulary.length) * 100;

      let html =
        '<div class="progress-section">' +
          '<div class="progress-header">' +
            '<span class="progress-text">마스터: ' + masteredCount + '/' + vocabulary.length + '</span>' +
            '<div class="stats">' +
              '<span class="stat-correct">정답: ' + stats.correct + '</span>' +
              '<span class="stat-incorrect">오답: ' + stats.incorrect + '</span>' +
              '<button class="reset-btn" id="resetBtn" title="리셋">🔄</button>' +
            '</div>' +
          '</div>' +
          '<div class="progress-bar">' +
            '<div class="progress-fill" style="width:' + progressPercent + '%"></div>' +
          '</div>';

      if (notUnderstoodCount > 0) {
        html += '<p class="review-notice">복습 대기: ' + notUnderstoodCount + '개</p>';
      }

      html +=
        '</div>' +
        '<div class="card-container">' +
          '<div class="question-section">' +
            '<div class="chinese-word">' + currentCard.chinese + '</div>' +
            '<div class="pinyin">' + currentCard.pinyin + '</div>' +
            '<button class="pronunciation-btn' + (isPlaying ? ' playing' : '') + '" id="speakBtn"' + (isPlaying ? ' disabled' : '') + '>' +
              '🔊 발음 듣기' +
            '</button>' +
          '</div>' +
          '<div class="answer-section">' +
            '<p class="question-prompt">이 단어의 뜻은?</p>' +
            '<div class="options">';

      for (let i = 0; i < options.length; i++) {
        const option = options[i];
        html +=
          '<button class="' + getButtonClass(option) + '" data-idx="' + i + '"' + (showResult ? ' disabled' : '') + '>' +
            '<span class="option-text">' + escapeHtml(option) + '</span>';

        if (showResult && option === currentCard.korean) html += '<span class="icon">✓</span>';
        if (showResult && option === selectedAnswer && option !== currentCard.korean) html += '<span class="icon">✗</span>';

        html += '</button>';
      }

      html +=
            '</div>' +
          '</div>';

      if (showResult) {
        const ok = selectedAnswer === currentCard.korean;
        html +=
          '<div class="result-message ' + (ok ? 'correct' : 'incorrect') + '">' +
            (ok ? '정답입니다! 🎉' : '틀렸습니다. 다시 나올 거예요! 💪') +
          '</div>';
      }

      html +=
        '</div>' +
        '<div class="hint">💡 정답을 선택하세요. 틀린 문제는 자동으로 다시 나옵니다</div>';

      app.innerHTML = html;

      document.getElementById('resetBtn').addEventListener('click', reset);
      document.getElementById('speakBtn').addEventListener('click', () => playPronunciation(currentCard.chinese));

      document.querySelectorAll('.option-btn[data-idx]').forEach(btn => {
        btn.addEventListener('click', () => {
          const idx = Number(btn.getAttribute('data-idx'));
          handleAnswer(idx);
        });
      });
    }

    init();
  </script>
</body>
</html>
