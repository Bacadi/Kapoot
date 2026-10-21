INSERT INTO quizzes (id, title, description)
VALUES (1, 'Culture générale', 'Teste tes connaissances');

INSERT INTO questions (id, quiz_id, label)
VALUES (1, 1, 'Quelle est la capitale de la France ?');

INSERT INTO answers (question_id, label, is_correct) VALUES
(1, 'Paris', 1),
(1, 'Lyon', 0),
(1, 'Marseille', 0),
(1, 'Lille', 0);