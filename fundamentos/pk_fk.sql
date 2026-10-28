--database: ./db.sqlite

--STRICT/PRIMARY KEY obriga a declarar TEXT ou INTEGER

CREATE TABLE cursos(
    id INTEGER PRIMARY KEY,
    nome TEXT,
    preco INTEGER
) STRICT;

INSERT INTO 
    cursos(nome, preco)
VALUES
    ('HTML',1000);

DROP TABLE cursos;

SELECT * FROM cursos;

SELECT TYPEOF (id) FROM cursos;

PRAGMA foreign_keys;

SELECT * FROM sqlite_schema;

--FOREIGN KEY

CREATE TABLE cursos(
    id INTEGER PRIMARY KEY,
    nome TEXT
 ) STRICT;

CREATE TABLE aulas(
    id INTEGER PRIMARY KEY,
    curso_id INTEGER,
    nome TEXT,
    FOREIGN KEY (curso_id) REFERENCES cursos(id) ON DELETE CASCADE ON UPDATE CASCADE --FK
)STRICT;

INSERT INTO cursos(nome) VALUES ('HTML');
INSERT INTO aulas(curso_id,nome) VALUES (1,'Fundamentos do HTML');

DROP TABLE aulas;
SELECT * FROM aulas;

DELETE FROM aulas WHERE id=2;

UPDATE cursos SET id=2 WHERE id = 1;

INSERT INTO cursos VALUES(3,'Teste');