--database: ./db.sqlite

--Tipos de dados

CREATE TABLE produtos2(
    id INT,
    descontinuado TYNYINT,
    nome VARCHAR(100),
    preco DECIMAL(10,2),
    descricao TEXT,
    data_criacao DATETIME
);

SELECT * FROM produtos2;

DELETE FROM produtos2 WHERE id IS NULL;

INSERT INTO 
    produtos2(id, descontinuado, nome, preco, descricao, data_criacao)
VALUES
    (1,0,'Notebook',200.5, NULL,'24-10-2049');

SELECT id, typeof(descricao) FROM produtos2;

INSERT INTO 
    produtos2(id, descontinuado, nome, preco, descricao, data_criacao)
VALUES
    ('1','0',999,'200.5', 100,2049);


SELECT * FROM cursos WHERE nome LIKE 'H______';
SELECT * FROM cursos WHERE nome LIKE '[C,J]%';

CREATE TABLE jogos(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    preco INTEGER NOT NULL
);

DELETE FROM jogos WHERE nome = 'Assassins';

INSERT INTO 
    jogos(nome, preco)
VALUES
    ('Assassins',100),
    ('Assassins',100),
    ('Assassins',100),
    ('Assassins',100),
    ('Assassins',100),
    ('Assassins',100);

ALTER TABLE jogos
ADD COLUMN saga TEXT;

INSERT INTO 
    jogos(nome,saga,preco)
VALUES
    ('Assassins','Ezio',10),
    ('Assassins','Brotherhood',15),
    ('Assassins','Revelations',10),
    ('Assassins','Black Flag',15),
    ('Assassins','Rouge',15);