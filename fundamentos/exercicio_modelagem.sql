--database: ./db.sqlite

CREATE TABLE usuarios (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    senha TEXT NOT NULL,
    email TEXT NOT NULL COLLATE NOCASE UNIQUE, --adicionado UNIQUE
    criado TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP --adcionado NOT NULL
)STRICT;

INSERT INTO 
    usuarios (nome,senha,email) 
VALUES
    ('Maria','linkzinho','maria@mayara.link');

CREATE TABLE cursos (
    id INTEGER PRIMARY KEY,
    slug TEXT NOT NULL COLLATE NOCASE UNIQUE, --Adicionado COLLATE NO CASE
    titulo TEXT NOT NULL UNIQUE,
    descricao TEXT NOT NULL,
    aulas INTEGER NOT NULL,
    horas INTEGER NOT NULL,
    criado TEXT DEFAULT CURRENT_TIMESTAMP
)STRICT;

INSERT INTO 
    cursos (slug,titulo,descricao, aulas, horas) 
VALUES
    ('javascript-basico','JavasCript Básico','Aprenda os fundamentos',20,5);

CREATE TABLE aulas(
    id INTEGER PRIMARY KEY,
    curso_id INTEGER NOT NULL,
    slug TEXT NOT NULL COLLATE NOCASE, --Declarar UNIQUE fora
    titulo TEXT NOT NULL,
    materia TEXT NOT NULL,
    materia_slug TEXT NOT NULL,
    seconds INTEGER NOT NULL,
    video TEXT NOT NULL,
    descricao TEXT NOT NULL,
    ordem_aula INTEGER NOT NULL,
    gratuito INTEGER NOT NULL DEFAULT 0 CHECK (gratuito IN (0,1)),--Esqueci do INTEGER
    criado TEXT DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (curso_id, slug)
    FOREIGN KEY (curso_id) REFERENCES cursos(id) --Lembrar de colocar NOT NULL na FK quando aplicável
)STRICT;

INSERT INTO
    aulas(curso_id,slug,titulo,materia,materia_slug,
    seconds,video,descricao,ordem_aula,gratuito)
VALUES
    (1,'variaveis-let-const','Variáveis: let e const','Fundamentos','fundamentos',
    480,'variaveis.mp4','Entenda a diferença entre let, const e var.',3,1);


CREATE TABLE aulas_finalizadas(
    user_id INTEGER NOT NULL,
    curso_id INTEGER NOT NULL,
    aula_id INTEGER NOT NULL,
    finalizado TEXT DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, curso_id, aula_id),
    FOREIGN KEY (user_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (curso_id) REFERENCES cursos(id),
    FOREIGN KEY (aula_id) REFERENCES aulas(id) 
)STRICT;

INSERT INTO 
    aulas_finalizadas(user_id, curso_id, aula_id) 
VALUES (1,1,1);

CREATE TABLE certificados(
    id TEXT PRIMARY KEY,
    user_id INTEGER NOT NULL,
    curso_id INTEGER NOT NULL,
    finalizado TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (user_id, curso_id),
    FOREIGN KEY (user_id) REFERENCES usuarios(id) ON DELETE CASCADE ,
    FOREIGN KEY (curso_id) REFERENCES cursos(id) ON DELETE CASCADE 
)STRICT;

INSERT INTO 
    certificados(id,user_id, curso_id) 
VALUES ('tristeristetriste',1,1);


DROP TABLE IF EXISTS cursos;

SELECT rowid,* FROM certificados;