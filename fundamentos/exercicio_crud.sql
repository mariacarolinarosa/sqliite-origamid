--database: ./db.sqlite

--Exercício Tabela 1
CREATE TABLE
    produtos (
        id INTEGER NOT NULL,
        nome TEXT NOT NULL,
        preco INTEGER NOT NULL
    );

INSERT INTO
    produtos (id, nome, preco)
VALUES
    (1, 'Notebook', 1000),
    (2, 'Smartphone', 500),
    (3, 'Tablet', 300);

--Tabela 2
CREATE TABLE
    clientes (
        id INTEGER NOT NULL,
        nome TEXT NOT NULL,
        email TEXT NOT NULL
    );

INSERT INTO
    clientes (id, nome, email)
VALUES
    (1, 'Maria', 'maria@email.com'),
    (2, 'João', 'joão@email.com');

SELECT
    *
from
    clientes;

--Tabela 3
CREATE TABLE
    compras (
        id INTEGER NOT NULL,
        cliente_id INTEGER NOT NULL,
        produto_id INTEGER NOT NULL,
        data TEXT NOT NULL
    );

INSERT INTO
    compras (id, cliente_id, produto_id, data)
VALUES
    (1, 2, 1, '2049-01-01'),
    (2, 1, 2, '2049-01-02'),
    (3, 2, 3, '2049-01-03');

ALTER TABLE compras
RENAME COLUMN curso_id TO produto_id;

DELETE FROM compras
WHERE
    id > 0;

SELECT nome FROM produtos;

SELECT * FROM compras WHERE cliente_id = 2;

SELECT * FROM produtos;

SELECT nome FROM produtos WHERE preco > 400;
