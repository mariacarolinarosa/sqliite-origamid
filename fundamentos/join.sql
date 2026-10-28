--database: ./db.sqlite

--INNER JOIN

SELECT * FROM lessons_completed;

/* QUERY sem a utilização de alias

SELECT users.name, lessons_completed.lesson_id 
FROM lessons_completed 
JOIN users ON lessons_completed.user_id = users.id;
*/

SELECT u.name, l.title AS titulo_licao, c.title AS titulo_curso
FROM lessons_completed AS lc
JOIN users AS u ON lc.user_id = u.id
JOIN lessons AS l ON lc.lesson_id = l.id
JOIN courses as c ON lc.course_id = c.id;

--LEFT JOIN

SELECT lc.user_id,l.title, lc.completed FROM lessons AS l
LEFT JOIN lessons_completed AS lc
ON lc.lesson_id = l.id AND lc.user_id = 1;

--SELF JOIN encontrar valores duplicados

SELECT a.id, a.slug
FROM lessons AS a
JOIN lessons AS b
ON a.slug = b.slug
WHERE a.id != b.id;