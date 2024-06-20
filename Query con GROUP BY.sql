-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT YEAR(enrolment_date) AS anno_iscrizione, COUNT(*) AS numero_iscritti
FROM students
GROUP BY anno_iscrizione
ORDER BY anno_iscrizione;

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT teachers.office_address AS indirizzo_ufficio, COUNT(*) AS numero_insegnanti
FROM teachers
GROUP BY office_address
ORDER BY office_address;

-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT exams.date AS appello_esame, AVG(exam_student.vote) AS media_voti
FROM exam_student
JOIN exams ON exam_student.exam_id = exams.id
GROUP BY appello_esame
ORDER BY appello_esame;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT departments.name AS dipartimenti, COUNT(*) AS numero_corsi
FROM degrees
JOIN departments ON degrees.department_id = departments.id
GROUP BY dipartimenti
ORDER BY numero_corsi;