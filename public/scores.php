<?php
require_once __DIR__ . '/../includes/auth.php';
require_once __DIR__ . '/../config/database.php';

// 1. La liste des quiz (pour les onglets)
$quizzes = $pdo->query('SELECT id, title FROM quizzes')->fetchAll(PDO::FETCH_ASSOC);

// 2. Quel quiz afficher ? Celui de l'URL, sinon le premier
$quiz_id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);
if (!$quiz_id && $quizzes) {
    $quiz_id = $quizzes[0]['id'];
}

// 3. Le meilleur score de chaque joueur pour ce quiz
$ranking = [];
if ($quiz_id) {
    $stmt = $pdo->prepare(
        'SELECT u.pseudo, MAX(s.score) AS best_score, MAX(s.total) AS total
         FROM scores s
         JOIN users u ON u.id = s.user_id
         WHERE s.quiz_id = ?
         GROUP BY u.id, u.pseudo
         ORDER BY best_score DESC'
    );
    $stmt->execute([$quiz_id]);
    $ranking = $stmt->fetchAll(PDO::FETCH_ASSOC);
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Scores</title>
</head>

<body>
    <header>
        <a href="quiz_select.php">Retour aux quiz</a>
        <a href="logout.php">Déconnexion</a>
    </header>
    <main>
        <h1>Classements</h1>

        <nav>
            <?php foreach ($quizzes as $quiz): ?>
                <a href="scores.php?id=<?= (int) $quiz['id'] ?>">
                    <?= htmlspecialchars($quiz['title'], ENT_QUOTES, 'UTF-8') ?>
                </a>
            <?php endforeach; ?>
        </nav>

        <?php if (empty($ranking)): ?>
            <p>Personne n'a encore joué à ce quiz.</p>
        <?php else: ?>
            <table>
                <thead>
                    <tr>
                        <th>Rang</th>
                        <th>Joueur</th>
                        <th>Meilleur score</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($ranking as $i => $row): ?>
                        <tr>
                            <td><?= $i + 1 ?></td>
                            <td><?= htmlspecialchars($row['pseudo'], ENT_QUOTES, 'UTF-8') ?></td>
                            <td><?= (int) $row['best_score'] ?> / <?= (int) $row['total'] ?></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
            <canvas id="scoreChart"></canvas>
        <?php endif; ?>
    </main>
    <?php if (!empty($ranking)): ?>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
            const chartLabels = <?= json_encode(array_column($ranking, 'pseudo'), JSON_HEX_TAG | JSON_HEX_AMP | JSON_HEX_APOS | JSON_HEX_QUOT) ?>;
            const chartScores = <?= json_encode(array_map('intval', array_column($ranking, 'best_score'))) ?>;
            const chartTotal = <?= (int) max(array_column($ranking, 'total')) ?>;
        </script>
        <script src="assets/scores_chart.js"></script>
    <?php endif; ?>
</body>

</html>