<?php
require_once __DIR__ . '/../includes/auth.php';
require_once __DIR__ . '/../config/database.php';

$quiz_id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);

if (!$quiz_id) {
    header('Location: quiz_select.php');
    exit;
}

// 1. Le quiz existe ?
$stmt = $pdo->prepare('SELECT id, title FROM quizzes WHERE id = ?');
$stmt->execute([$quiz_id]);
$quiz = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$quiz) {
    header('Location: quiz_select.php');
    exit;
}

// 2. Les questions, dans un ordre aléatoire
$stmt = $pdo->prepare('SELECT id, label FROM questions WHERE quiz_id = ? ORDER BY RAND()');
$stmt->execute([$quiz_id]);
$questions = $stmt->fetchAll(PDO::FETCH_ASSOC);

// 3. Les réponses de chaque question
$stmtAnswers = $pdo->prepare('SELECT id, label, is_correct FROM answers WHERE question_id = ? ORDER BY RAND()');

foreach ($questions as $i => $question) {
    $stmtAnswers->execute([$question['id']]);
    $questions[$i]['answers'] = $stmtAnswers->fetchAll(PDO::FETCH_ASSOC);
}
?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Playing quiz</title>
    <link rel="stylesheet" href="assets/style.css">
</head>

<body>
    <main>
        <a href="quiz_select.php">Quitter</a>
        <h1><?= htmlspecialchars($quiz['title'], ENT_QUOTES, 'UTF-8') ?></h1>
        <p>Score : <span id="score">0</span> | Temps : <span id="timer"></span></p>
        <div id="quiz"></div>
        <button id="nextBtn" type="button" disabled>Suivant</button>
    </main>

    <script>
        const questions = <?= json_encode($questions, JSON_HEX_TAG | JSON_HEX_AMP | JSON_HEX_APOS | JSON_HEX_QUOT) ?>;
        const quizId = <?= (int) $quiz['id'] ?>;
    </script>
    <script src="assets/quiz.js"></script>
</body>

</html>