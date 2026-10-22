const quizContainer = document.querySelector('#quiz');
const nextBtn = document.querySelector('#nextBtn');

let currentIndex = 0;
let score = 0;

function showQuestion(index) {
    const question = questions[index];
    quizContainer.replaceChildren();

    const title = document.createElement('h2');
    title.textContent = question.label;
    quizContainer.appendChild(title);

    question.answers.forEach(answer => {
        const btn = document.createElement('button');
        btn.textContent = answer.label;
        quizContainer.appendChild(btn);
        btn.addEventListener('click', () => {

            if (answer.is_correct === 1){
                btn.classList.add('correct');
                score++;
            } else {
                btn.classList.add('wrong');
            }
            btn.disabled = true
            nextBtn.disabled = false;
        })
        stopTimer();
    });

    const affScore = document.createElement('span');
    affScore.textContent = score;
    quizContainer.appendChild(affScore);
    startTimer();
}

if (questions.length > 0) {
    showQuestion(currentIndex);
} else {
    quizContainer.textContent = "Ce quiz ne contient pas encore de questions.";
}

nextBtn.addEventListener('click', () =>{
    currentIndex++;
    nextBtn.disabled = true;
    showQuestion(currentIndex);
    if (currentIndex === questions.lenght){

    }
})

let TIME_LIMIT = 15;
let timeleft;
let timerId;
const timeSpan = document.querySelector('#timer')

function startTimer () {
    timeleft = TIME_LIMIT;
    timeSpan.textContent = timeleft;
    timerId = setInterval(() => {
        timeleft--;
        timeSpan.textContent = timeleft;
    }, 1000);
    if (timeleft == 0){
        clearInterval(timerId);
        document.querySelectorAll('button').disabled = true;
        nextBtn.disabled = false;

    }
}

function stopTimer () {
    clearInterval(timerId);
}