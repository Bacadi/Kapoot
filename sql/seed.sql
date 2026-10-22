

INSERT INTO questions (id, quiz_id, label)
VALUES (2, 1, 'Qui à écrit "Les Misérables" ?');

INSERT INTO answers (question_id, label, is_correct) VALUES
(2, 'Victor Hugo', 1),
(2, 'Hector Hugo', 0),
(2, 'Igor Hugo', 0),
(2, 'Hugo Clément', 0);