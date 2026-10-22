<?php
session_start();
require_once __DIR__ . '/../config/database.php';

header('Content-Type: application/json');

if (!isset($_SESSION['user_id'])) {
    http_response_code(401);
    echo json_encode(['error' => 'Non connecté']);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(['error' => 'Méthode non autorisée']);
    exit;
}

$data = json_decode(file_get_contents('php://input'), true);
$quiz_id = filter_var($data['quiz_id'] ?? null, FILTER_VALIDATE_INT);
$score   = filter_var($data['score'] ?? null, FILTER_VALIDATE_INT);
$total   = filter_var($data['total'] ?? null, FILTER_VALIDATE_INT);

if ($quiz_id === false || $score === false || $total === false
    || $total <= 0 || $score < 0 || $score > $total) {
    http_response_code(400);
    echo json_encode(['error' => 'Données invalides']);
    exit;
}

$stmt = $pdo->prepare('SELECT id FROM quizzes WHERE id = ?');
$stmt->execute([$quiz_id]);
if (!$stmt->fetch()) {
    http_response_code(404);
    echo json_encode(['error' => 'Quiz introuvable']);
    exit;
}

$stmt = $pdo->prepare('INSERT INTO scores (user_id, quiz_id, score, total) VALUES (?, ?, ?, ?)');
$stmt->execute([$_SESSION['user_id'], $quiz_id, $score, $total]);

echo json_encode(['success' => true]);