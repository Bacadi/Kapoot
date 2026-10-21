<?php
session_start();
require_once __DIR__ . '/../config/database.php';

$username = '';
$warning = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = trim($_POST['username'] ?? '');

    if ($username === '') {
        $warning = 'Please enter a username.';
    } else {
        $stmt = $pdo->prepare('SELECT id, pseudo FROM users WHERE pseudo = ?');
        $stmt->execute([$username]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user) {
            // Pseudo connu : on récupère son id
            $userId = $user['id'];
            $username = $user['pseudo'];
        } else {
            // Pseudo inconnu : on crée l'utilisateur
            $stmt = $pdo->prepare('INSERT INTO users (pseudo) VALUES (?)');
            $stmt->execute([$username]);
            $userId = $pdo->lastInsertId();
        }

        session_regenerate_id(true);
        $_SESSION['user_id'] = (int) $userId;
        $_SESSION['pseudo'] = $username;
        header('Location: quiz_select.php');
        exit;
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz - Login</title>
</head>

<body>
    <form method="post">
        <label for="username">User: </label>
        <input id="username" name="username" type="text" placeholder="Enter your username" maxlength="50" required
            value="<?= htmlspecialchars($username, ENT_QUOTES, 'UTF-8') ?>">
        <?php if ($warning !== ''): ?>
            <p role="alert"><?= htmlspecialchars($warning, ENT_QUOTES, 'UTF-8') ?></p>
        <?php endif; ?>
        <button type="submit">Submit</button>
    </form>
</body>

</html>