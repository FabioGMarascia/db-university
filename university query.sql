-- 1 - Selezionare tutti gli studenti nati nel 1990 (160)
SELECT date_of_birth FROM `students` WHERE date_of_birth LIKE '%1990%'; 

-- 2 - Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT cfu FROM `courses` WHERE cfu > 10; 

-- 3 - Selezionare tutti gli studenti che ad OGGI hanno almeno 30 anni compiuti (3725)
SELECT date_of_birth FROM `students` WHERE TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) >= 30; 

-- 4 - Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT * FROM `courses` WHERE period = 'I semestre' && year = 1; 

-- 5 - Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
SELECT * FROM `exams` WHERE date = '2020-06-20' AND TIME(hour) > '14:00:00';

-- 6 - Selezionare tutti i corsi di laurea magistrale (38)
SELECT * FROM `degrees` WHERE level = 'magistrale';

-- 7 - Da quanti dipartimenti è composta l'università? (12)
SELECT * FROM `departments`;

-- 8 - Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT phone FROM `teachers` WHERE phone <> 'NULL';

-- 9 - Inserire nella tabella degli studenti un nuovo record con i propri dati (per il campo degree_id, inserire un valore casuale)
INSERT INTO students (degree_id, name, surname, date_of_birth, fiscal_code, enrolment_date, registration_number, email)
VALUES (FLOOR(RAND() * 100) + 1, 'Fabio Gaspare', 'Marascia', '1996-03-14', 'MRSFGS96C14E974M', '2018-09-14', '625033', 'fabiogaspare.marascia@gmail.com');

-- 10 - Cambiare il numero dell’ufficio del professor Pietro Rizzo in 126
UPDATE teachers SET office_number = 126 WHERE name = 'Pietro' && surname = 'Rizzo';

-- 11 - Eliminare dalla tabella studenti il record creato precedentemente al punto 9
DELETE FROM `students` WHERE name = 'Fabio Gaspare' && surname = 'Marascia' && email = 'fabiogaspare.marascia@gmail.com' && fiscal_code = 'MRSFGS96C14E974M';





