const quizContainer = document.querySelector('#quiz');
const nextBtn = document.querySelector('#nextBtn');
const scoreEl = document.querySelector('#score');
const timeSpan = document.querySelector('#timer');

const TIME_LIMIT = 15;
let currentIndex = 0;
let score = 0;
let timeLeft;
let timerId;

function stopTimer() {
    clearInterval(timerId);
}

function startTimer(buttons) {
    stopTimer();
    timeLeft = TIME_LIMIT;
    timeSpan.textContent = timeLeft;

    timerId = setInterval(() => {
        timeLeft--;
        timeSpan.textContent = timeLeft;

        if (timeLeft <= 0) {
            stopTimer();
            buttons.forEach(b => b.disabled = true);
            nextBtn.disabled = false;
        }
    }, 1000);
}

function showQuestion(index) {
    const question = questions[index];
    quizContainer.replaceChildren();

    const title = document.createElement('h2');
    title.textContent = question.label;
    quizContainer.appendChild(title);

    const buttons = [];

    question.answers.forEach(answer => {
        const btn = document.createElement('button');
        btn.textContent = answer.label;
        buttons.push(btn);
        quizContainer.appendChild(btn);

        btn.addEventListener('click', () => {
            stopTimer();
            if (Number(answer.is_correct) === 1) {
                btn.classList.add('correct');
                score++;
                scoreEl.textContent = score;
            } else {
                btn.classList.add('wrong');
            }
            buttons.forEach(b => b.disabled = true);
            nextBtn.disabled = false;
        });
    });

    startTimer(buttons);
}

function showResult() {
    stopTimer();
    quizContainer.replaceChildren();
    nextBtn.hidden = true;
    timeSpan.textContent = '-';

    const result = document.createElement('h2');
    result.textContent = `Terminé ! Score : ${score} / ${questions.length}`;
    quizContainer.appendChild(result);

    saveScore();
}

nextBtn.addEventListener('click', () => {
    currentIndex++;
    nextBtn.disabled = true;

    if (currentIndex === questions.length) {
        showResult();
    } else {
        showQuestion(currentIndex);
    }
});

if (questions.length > 0) {
    showQuestion(currentIndex);
} else {
    quizContainer.textContent = "Ce quiz ne contient pas encore de questions.";
    nextBtn.hidden = true;
}

function saveScore() {
    fetch('../api/save_score.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ quiz_id: quizId, score: score, total: questions.length })
    })
        .then(response => response.json())
        .then(data => console.log(data))
        .catch(error => console.error(error));
}