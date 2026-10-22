<?php
require_once __DIR__ . '/../includes/auth.php';
require_once __DIR__ . '/../config/database.php';

$req = $pdo->query('SELECT id, title, description FROM quizzes');
$quizzes = $req->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz select</title>
</head>

<body>
    <header>
        <a href="scores.php">Scores</a>
        <a href="logout.php">Déconnexion</a>
    </header>
    <main>
        <h1>Bonjour <?= htmlspecialchars($_SESSION['pseudo'], ENT_QUOTES, 'UTF-8') ?></h1>
        <section id="quizList">
            <h2>Liste des quizzes</h2>
            <?php foreach ($quizzes as $quiz): ?>
                <div class="quizCard">
                    <h3><?= htmlspecialchars($quiz['title'], ENT_QUOTES, 'UTF-8') ?></h3>
                    <p><?= htmlspecialchars($quiz['description'], ENT_QUOTES, 'UTF-8') ?></p>
                    <a class="playBtn" href="play.php?id=<?= (int) $quiz['id'] ?>">Jouer</a>
                </div>
            <?php endforeach; ?>
        </section>
    </main>
</body>

</html>