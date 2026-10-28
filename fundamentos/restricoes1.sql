--database: ./db.sqlite
--NULL
--UNIQUE (pode ser usado para criar chaves primárias compostas)
--COLLATE NOCASE deixa de diferenciar maiúsculas e minúsculas
--DEFAULT define um valor padrão
--CHECK verifica se o dado atende a uma condição
--SQL não tem booleano nativo

CREATE TABLE
    usuario (
        id INTEGER PRIMARY KEY,
        email TEXT NOT NULL COLLATE NOCASE UNIQUE, --COLATE
        nome TEXT NOT NULL,
        tipo TEXT NOT NULL DEFAULT 'usuario' CHECK (tipo IN ('usuario', 'admin')),  --CHECK
        vitalicio INTEGER DEFAULT 0 CHECK (vitalicio IN (0,1)),
        criado TEXT DEFAULT CURRENT_TIMESTAMP --DEFAULT
    ) STRICT;

CREATE TABLE
    certificados (
        id INTEGER PRIMARY KEY, --PK
        usuario_id INTEGER NOT NULL, --NOT NULL
        curso_id INTEGER NOT NULL,
        UNIQUE (usuario_id, curso_id) --UNIQUE
    ) STRICT;

DROP TABLE usuario;

DROP TABLE certificados;

INSERT INTO
    usuario (email, nome)
VALUES
    ('maria@mayara.link', 'Maria');

INSERT INTO
    usuario (email, nome, tipo, vitalicio)
VALUES
    ('mayara@link.maria', 'Mayara', 'admin',1);

INSERT INTO
    certificados (usuario_id, curso_id)
VALUES
    (1, 1);
