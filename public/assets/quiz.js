const quizContainer = document.querySelector('#quiz');
let currentIndex = 0;

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
    });
}

if (questions.length > 0) {
    showQuestion(currentIndex);
} else {
    quizContainer.textContent = "Ce quiz ne contient pas encore de questions.";
}