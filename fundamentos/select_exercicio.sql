--database: ./db.sqlite

-- Usei vários JOINS para treinar, mas lembrar que às vezes é interessante usar subquery para otimizar o processamento

-- 1 - Selecione todas as aulas do curso de html-para-iniciantes e ordene por lesson_order
-- em ordem crescente.
SELECT * FROM lessons;

SELECT * FROM lessons AS l --Opção 1
WHERE l.course_id = 1
ORDER BY l.lesson_order ASC;


SELECT * FROM lessons --Resposta professor
WHERE course_id = (SELECT id FROM courses WHERE slug = 'html-para-iniciantes')
ORDER BY lesson_order ASC;

-- 2 - Somar o total de segundos das aulas do curso de css-animacoes.

SELECT * FROM courses;

SELECT SUM(seconds) AS total_segundos_curso --resposta professor
FROM lessons
WHERE course_id = (SELECT id FROM courses WHERE slug = 'css-animacoes');

/* SELECT c.horas*3600 AS total_segundos_curso --errei, investigar
FROM courses AS c
WHERE c.slug = 'css-animacoes'; */

-- 3 - Contar o total de aulas e agrupar por curso.

SELECT * FROM lessons;

SELECT course_id, COUNT(*) --Opção 1
FROM lessons 
GROUP BY lessons.course_id;

SELECT c.id, c.title AS nome_curso,  COUNT(*) AS total_aulas --Opção 2
FROM lessons AS l
JOIN courses AS c ON l.course_id = c.id
GROUP BY l.course_id;


-- 4 - Somar o total de segundos das aulas, agrupar por curso e ordenar o total de
-- segundos por ordem decrescente.

SELECT l.course_id, SUM(l.seconds) AS sum_s --minha sugestão
FROM lessons AS l
JOIN courses AS c ON c.id = l.course_id
GROUP BY l.course_id --sugestao chat
ORDER BY sum_s DESC;

-- 5 - Utilize a query 4, e filtre apenas os cursos que possuem mais de 2300 
-- segundos de aulas. Continue ordenando.

SELECT course_id, SUM(seconds) AS total_seconds --minha sugestão
FROM lessons
GROUP BY course_id
HAVING total_seconds > 2300 
ORDER BY total_seconds DESC;

-- 6 - Utilize a query 4, mostre o título do curso no lugar do course_id.
SELECT c.title, SUM(l.seconds) AS sum_s --minha sugestão
FROM lessons AS l
JOIN courses AS c ON c.id = l.course_id
GROUP BY c.id
ORDER BY sum_s DESC;

-- 7 - Selecione o ID dos certificados de mariana@email.com
/*SELECT c.id
FROM certificates AS c
JOIN users AS u ON u.id = c.user_id
WHERE u.email = 'mariana@email.com';*/

SELECT id FROM certificates --RESPOSTA PROF
WHERE user_id = (SELECT id FROM users WHERE email = 'mariana@email.com');
 
-- 8 - Selecione todas as aulas completas ou não pelo usuário lucas@email.com.
-- Mostre o título da aula e se está completa ou não.

SELECT * FROM lessons AS l --Resposta do professor
LEFT JOIN lessons_completed as lc ON l.id = lc.lesson_id 
    AND lc.user_id = (SELECT id FROM users WHERE email = 'lucas@email.com');


-- 9 - Selecione as aulas anterior/próxima da aula funcoes-e-escopo. 
-- Retorne 3 aulas (se existirem): a anterior, 
-- a atual e a próxima. Utilize o lesson_order para isso.

--Repostas do professor
SELECT * FROM lessons
WHERE course_id = 3
AND lesson_order IN (2,3,4)
ORDER BY lesson_order;

--OU

SELECT * FROM lessons
WHERE course_id = (SELECT course_id FROM lessons WHERE slug = 'funcoes-e-escopo')
AND lesson_order IN (
    (SELECT lesson_order FROM lessons WHERE slug = 'funcoes-e-escopo')-1,
    (SELECT lesson_order FROM lessons WHERE slug = 'funcoes-e-escopo'),
    (SELECT lesson_order FROM lessons WHERE slug = 'funcoes-e-escopo')+1)
ORDER BY lesson_order;

--ALternativo
WITH current AS(
    SELECT course_id,lesson_order FROM lessons WHERE slug = 'introducao-ao-html'
)
SELECT * FROM lessons
WHERE course_id = (SELECT course_id FROM lessons WHERE slug = 'introducao-ao-html')
AND lesson_order IN (
    (SELECT lesson_order FROM current)-1,
    (SELECT lesson_order FROM current),
    (SELECT lesson_order FROM current)+1
)ORDER BY lesson_order;