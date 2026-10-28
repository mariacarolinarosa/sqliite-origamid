--database: ./db.sqlite

CREATE TABLE produtos(
    id INTEGER PRIMARY KEY,
    nome TEXT
)STRICT;


CREATE TABLE pedidos(
    id INTEGER PRIMARY KEY,
    criado TEXT DEFAULT CURRENT_TIMESTAMP
)STRICT;

CREATE TABLE pedidos_produtos(
    pedido_id INTEGER,
    produto_id INTEGER,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id) ON DELETE CASCADE,
    FOREIGN KEY (produto_id) REFERENCES produtos(id) ON DELETE CASCADE
)STRICT;

INSERT INTO produtos(nome) VALUES ('Notebook');
INSERT INTO produtos(nome) VALUES ('Smartphone');
INSERT INTO pedidos (id) VALUES (1);
INSERT INTO pedidos_produtos (pedido_id, produto_id) VALUES (1,1), (1,2);

--TABELA REFERÊNCIA usada quando valores de atributos se repetem com freqência
CREATE TABLE "status_pedido" (
  "id" INTEGER PRIMARY KEY,
  "nome" TEXT UNIQUE NOT NULL,
  "cor" TEXT NOT NULL,
  "encerrado" INTEGER NOT NULL CHECK ("encerrado" IN (0,1))
) STRICT;

INSERT INTO
  "status_pedido" ("nome", "cor", "encerrado")
VALUES
  ('aguardando', '#FFC107', 0),
  ('pago', '#17A2B8', 0),
  ('separando', '#007BFF', 0),
  ('enviado', '#6610F2', 0),
  ('entregue', '#28A745', 1),
  ('cancelado', '#DC3545', 1);

CREATE TABLE "pedidos_com_status" (
  "id" INTEGER PRIMARY KEY,
  "valor_total" INTEGER NOT NULL,
  "status_id" INTEGER NOT NULL,
  FOREIGN KEY ("status_id") REFERENCES "status_pedido" ("id") ON DELETE CASCADE
) STRICT;

INSERT INTO
  pedidos_com_status ("valor_total", "status_id")
VALUES
  (100, 1), (200, 2), (150, 3);

DROP TABLE status_pedido;
