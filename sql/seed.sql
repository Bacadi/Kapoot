USE quiz_app;

-- Remise à zéro (garde la table users)
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE answers;
TRUNCATE TABLE questions;
TRUNCATE TABLE scores;
TRUNCATE TABLE quizzes;
SET FOREIGN_KEY_CHECKS = 1;

-- QUIZ
INSERT INTO quizzes (id, title, description) VALUES
(1, 'Culture générale', 'Géographie, art et histoire : teste ta culture !'),
(2, 'Arithmétique simple', 'Du calcul mental, rapide et sans calculatrice.'),
(3, 'Constantes physiques', 'Vitesse de la lumière, Avogadro, Planck... les connais-tu ?');

-- QUESTIONS
INSERT INTO questions (id, quiz_id, label) VALUES
(1, 1, 'Quelle est la capitale de l''Australie ?'),
(2, 1, 'Qui a peint la Joconde ?'),
(3, 1, 'Quel est le plus grand océan du monde ?'),
(4, 1, 'En quelle année l''homme a-t-il marché sur la Lune pour la première fois ?'),
(5, 1, 'Quel est le plus long fleuve de France ?'),

(6, 2, 'Combien font 7 × 8 ?'),
(7, 2, 'Combien font 144 ÷ 12 ?'),
(8, 2, 'Combien font 15 + 27 ?'),
(9, 2, 'Combien font 100 − 37 ?'),
(10, 2, 'Combien font 9² ?'),

(11, 3, 'Quelle est la vitesse de la lumière dans le vide (environ) ?'),
(12, 3, 'Quelle est la valeur de l''accélération de la pesanteur à la surface de la Terre ?'),
(13, 3, 'Quelle est la valeur du zéro absolu en degrés Celsius ?'),
(14, 3, 'Quelle est la valeur approximative du nombre d''Avogadro ?'),
(15, 3, 'Quelle est la valeur approximative de la constante de Planck h ?');

-- RÉPONSES (is_correct = 1 pour la bonne réponse)
INSERT INTO answers (question_id, label, is_correct) VALUES
-- Q1 Capitale de l'Australie
(1, 'Sydney', 0),
(1, 'Canberra', 1),
(1, 'Melbourne', 0),
(1, 'Brisbane', 0),
-- Q2 La Joconde
(2, 'Michel-Ange', 0),
(2, 'Raphaël', 0),
(2, 'Léonard de Vinci', 1),
(2, 'Botticelli', 0),
-- Q3 Plus grand océan
(3, 'Océan Atlantique', 0),
(3, 'Océan Pacifique', 1),
(3, 'Océan Indien', 0),
(3, 'Océan Arctique', 0),
-- Q4 Premier pas sur la Lune
(4, '1961', 0),
(4, '1965', 0),
(4, '1969', 1),
(4, '1972', 0),
-- Q5 Plus long fleuve de France
(5, 'La Seine', 0),
(5, 'Le Rhône', 0),
(5, 'La Garonne', 0),
(5, 'La Loire', 1),

-- Q6 7 × 8
(6, '54', 0),
(6, '56', 1),
(6, '58', 0),
(6, '64', 0),
-- Q7 144 ÷ 12
(7, '10', 0),
(7, '11', 0),
(7, '12', 1),
(7, '14', 0),
-- Q8 15 + 27
(8, '32', 0),
(8, '42', 1),
(8, '43', 0),
(8, '52', 0),
-- Q9 100 − 37
(9, '57', 0),
(9, '63', 1),
(9, '67', 0),
(9, '73', 0),
-- Q10 9²
(10, '18', 0),
(10, '72', 0),
(10, '81', 1),
(10, '99', 0),

-- Q11 Vitesse de la lumière
(11, '30 000 km/s', 0),
(11, '150 000 km/s', 0),
(11, '300 000 km/s', 1),
(11, '3 000 000 km/s', 0),
-- Q12 Pesanteur terrestre
(12, '1,62 m/s²', 0),
(12, '3,71 m/s²', 0),
(12, '9,81 m/s²', 1),
(12, '24,8 m/s²', 0),
-- Q13 Zéro absolu
(13, '−100 °C', 0),
(13, '0 °C', 0),
(13, '−273,15 °C', 1),
(13, '−460 °C', 0),
-- Q14 Nombre d'Avogadro
(14, '6,022 × 10¹⁹ mol⁻¹', 0),
(14, '6,022 × 10²³ mol⁻¹', 1),
(14, '3,141 × 10²³ mol⁻¹', 0),
(14, '9,81 × 10²³ mol⁻¹', 0),
-- Q15 Constante de Planck
(15, '6,626 × 10⁻³⁴ J·s', 1),
(15, '6,626 × 10⁻²⁴ J·s', 0),
(15, '1,602 × 10⁻¹⁹ J·s', 0),
(15, '9,109 × 10⁻³¹ J·s', 0);