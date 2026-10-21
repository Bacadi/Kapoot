<?php

$dsn = 'mysql:host=localhost;dbname=quiz_app;charset=utf8mb4';
$user = "root";

try {
    $pdo = new PDO($dsn, $user, '');
    $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
} 
catch (PDOException $e) { 
    die('Erreur de connexion à la base de données : ' . $e->getMessage());
}
