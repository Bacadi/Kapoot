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
    <title>quiz select</title>
</head>

<body>
    <main>
        <section id="quizList">
            <?php
            foreach ($quizzes as $quiz):?>
                <div class="quizCard">
                    <h2>Quiz n° <?= htmlspecialchars($quiz['id'])?></h2>
                    <h3><?= htmlspecialchars($quiz['title']) ?></h3>
                </div>
            <?php endforeach; ?>
        </section>
    </main>
</body>

</html>