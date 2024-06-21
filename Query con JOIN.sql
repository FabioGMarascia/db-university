-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT students.name, students.surname, degrees.name
FROM students 
JOIN degrees ON students.degree_id = degrees.department_id
WHERE degrees.name = 'Corso di Laurea in Economia';

-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT departments.name AS dipartimento, degrees.name AS corsi_di_laurea_magistrale
FROM departments 
JOIN degrees ON departments.id = degrees.department_id
WHERE departments.name = 'Dipartimento di Neuroscienze' && degrees.level = 'magistrale';

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT courses.name AS corsi_di_Fulvio_Amato, course_teacher.teacher_id
FROM courses 
JOIN course_teacher ON courses.id = course_teacher.course_id
WHERE course_teacher.teacher_id = 44;

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT students.name AS nome_studente, students.surname AS cognome_studente, departments.name AS nome_dipartimento, degrees.name AS corso_laurea
FROM students 
JOIN degrees ON students.degree_id = degrees.id 
JOIN departments ON degrees.department_id = departments.id
ORDER BY students.name ASC, students.surname ASC;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT degrees.name AS nome_corso, courses.name AS nome_corso, teachers.name AS nome_insegnate, teachers.surname AS cognome_insegnate
FROM degrees
JOIN courses ON degrees.id = courses.degree_id
JOIN course_teacher ON course_teacher.course_id = courses.id 
JOIN teachers ON course_teacher.teacher_id = teachers.id;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DISTINCT teachers.name AS nome_insegnate, teachers.surname AS cognome_insegnate 
FROM teachers 
JOIN course_teacher ON teachers.id = course_teacher.teacher_id 
JOIN courses ON course_teacher.course_id = courses.id 
JOIN degrees ON courses.degree_id = degrees.id 
JOIN departments ON degrees.department_id = departments.id 
WHERE departments.name = 'Dipartimento di Matematica'; 

-- 7. BONUS: Selezionare per ogni studente il numero di tentativi sostenuti per ogni esame, stampando anche il voto massimo. Successivamente, filtrare i tentativi con voto minimo 18.
-- NON CORRETTA ED INCOMPLETA
SELECT students.name AS nome_studente, students.surname AS cognome_studente, courses.name AS nome_corso, COUNT(*) AS numero_tentativi
FROM exam_student
JOIN students ON exam_student.student_id = students.id
JOIN exams ON exam_student.exam_id = exams.id
JOIN courses ON exams.course_id = courses.id
GROUP BY nome_corso
ORDER BY nome_studente ASC, cognome_studente ASC;
