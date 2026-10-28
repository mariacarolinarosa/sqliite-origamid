--database: ./db.sqlite
DROP TABLE cursos;

CREATE TABLE
    cursos (
        id INTEGER NOT NULL,
        nome TEXT NOT NULL,
        aulas INTEGER
    );

PRAGMA table_info ('cursos');

SELECT * FROM cursos;

--INSERT
INSERT INTO
    cursos (id, nome, aulas)
VALUES
    (1, 'HTML', 10),
    (2, 'CSS', 12),
    (3, 'JavaScript', 15);

--DELETE
DELETE FROM cursos
WHERE
    id = 1;

--SELECT
SELECT * FROM cursos;

SELECT * FROM cursos LIMIT 1;

SELECT * FROM cursos WHERE id != 2 LIMIT 1;

--UPDATE não esquecer do WHERE
UPDATE cursos
SET
    nome = 'HTML/CSS',
    aulas = 14
WHERE
    id = 1;

SELECT
    *
FROM
    produtos;

DROP TABLE aulas;
DROP TABLE cursos;

