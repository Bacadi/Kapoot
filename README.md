# 🔥 Quiz

Application de quiz interactive entre joueurs, réalisée en PHP, MySQL, HTML, CSS et JavaScript. On se connecte avec un simple pseudo, on choisit un quiz, on répond aux questions contre la montre, puis on compare son score avec ceux des autres joueurs.

## Fonctionnalités

- **Connexion par pseudo**, sans mot de passe : un pseudo inconnu crée un nouveau joueur, un pseudo connu reconnecte le joueur existant.
- **Choix du quiz** parmi plusieurs thèmes (culture générale, arithmétique simple, constantes physiques).
- **Questions et réponses dans un ordre aléatoire** à chaque partie.
- **Réponse verte ou rouge** dès la sélection, impossible de la modifier ensuite, bouton « Suivant » activé après la réponse.
- **Temps limité** par question : à la fin du compte à rebours, la question est comptée comme ratée.
- **Sauvegarde du score** à la fin de chaque partie.
- **Classements** par quiz : meilleur score de chaque joueur, sous forme de tableau et de graphique en barres.
- **Interface responsive**, adaptée aux écrans mobiles, tablettes et ordinateurs.

## Technologies

| Domaine | Outils |
|---|---|
| Backend | PHP (PDO, sessions) |
| Base de données | MySQL / MariaDB |
| Frontend | HTML, CSS, JavaScript (vanilla) |
| Graphique | [Chart.js](https://www.chartjs.org/) (via CDN) |

## Arborescence

```
quiz/
├── config/
│   └── database.php        connexion PDO à la base
├── includes/
│   └── auth.php            vérifie qu'un joueur est connecté
├── api/
│   └── save_score.php      enregistre un score (appelé en JS avec fetch)
├── public/
│   ├── index.php           connexion par pseudo
│   ├── quiz_select.php     choix du quiz
│   ├── play.php            partie de quiz
│   ├── scores.php          classements et graphique
│   ├── logout.php          déconnexion
│   └── assets/
│       ├──  style.css
│       ├──  quiz.js         logique du jeu (questions, timer, score)
│       └──  scores_chart.js graphique des classements
│        
└── sql/
    ├── quiz_app.sql          création de la base et des tables
    └── seed.sql            données de départ (3 quiz de 5 questions)
```

## Base de données

La base `quiz_app` contient 5 tables.

| Table | Rôle | Colonnes principales |
|---|---|---|
| `users` | les joueurs | `id`, `pseudo` (unique), `created_at` |
| `quizzes` | les quiz disponibles | `id`, `title`, `description` |
| `questions` | les questions d'un quiz | `id`, `quiz_id`, `label` |
| `answers` | les réponses possibles | `id`, `question_id`, `label`, `is_correct` |
| `scores` | une partie jouée | `id`, `user_id`, `quiz_id`, `score`, `total`, `played_at` |

Relations :

- un quiz possède plusieurs questions (`questions.quiz_id` → `quizzes.id`) ;
- une question possède plusieurs réponses, dont une seule correcte (`answers.question_id` → `questions.id`) ;
- un joueur possède plusieurs scores (`scores.user_id` → `users.id`) ;
- un quiz possède plusieurs scores (`scores.quiz_id` → `quizzes.id`).

La table `scores` fait le lien entre `users` et `quizzes` : un joueur peut jouer à plusieurs quiz, et un quiz peut être joué par plusieurs joueurs.

<!-- Ajouter ici le schéma exporté depuis drawsql.app :
![Schéma de la base de données](docs/schema.png)
-->

## Installation

### Prérequis

- PHP 8 ou supérieur
- MySQL ou MariaDB
- Un serveur local (XAMPP, WAMP, MAMP ou Laragon) avec phpMyAdmin

### Étapes

1. **Copier le projet** dans le dossier web du serveur local (par exemple `htdocs` pour XAMPP).
2. **Démarrer** Apache et MySQL depuis le panneau de contrôle.
3. **Créer la base** : dans phpMyAdmin, onglet **Importer**, importer `sql/schema.sql`.
4. **Ajouter les données de départ** : sélectionner la base `quiz_app`, onglet **Importer**, importer `sql/seed.sql` (format SQL, jeu de caractères utf-8).
5. **Vérifier la connexion** dans `config/database.php` : par défaut, hôte `localhost`, utilisateur `root`, sans mot de passe. À adapter si ta configuration est différente.
6. **Ouvrir l'application** dans le navigateur, à l'adresse de `public/index.php` (par exemple `http://localhost/quizz/public/index.php`).

## Utilisation

1. Saisir un pseudo sur la page d'accueil.
2. Choisir un quiz.
3. Répondre aux questions avant la fin du compte à rebours.
4. À la fin de la partie : rejouer, consulter le classement ou choisir un autre quiz.
5. Dans la page **Scores**, choisir un quiz pour voir le tableau des meilleurs scores et le graphique.

## Choix techniques

- **Connexion** : l'identifiant du joueur et son pseudo sont stockés dans `$_SESSION`. `includes/auth.php` protège les pages réservées aux joueurs connectés.
- **Sécurité** : requêtes préparées PDO, échappement des sorties avec `htmlspecialchars`, `session_regenerate_id` à la connexion. L'identifiant du joueur est toujours lu dans la session, jamais envoyé par le navigateur.
- **Sauvegarde du score** : le JavaScript envoie le résultat en POST (`fetch`) à `api/save_score.php`, qui valide les données avant de les enregistrer.
- **Classement** : une requête avec jointure et `MAX(score)` regroupé par joueur donne le meilleur score de chacun.
- **JavaScript** : le code est découpé en fonctions (`showQuestion`, `startTimer`, `stopTimer`, `showResult`, `saveScore`).

## Pistes d'amélioration

- Podium des trois meilleurs joueurs.
- Bonus de points selon le temps de réponse et séries de bonnes réponses.
- Correction détaillée en fin de partie (table `score_answers`).
- Lien de partage pour défier un ami sur un quiz.
- Mode sombre.

## Auteur

Projet réalisé dans le cadre de ma formation de développement web.