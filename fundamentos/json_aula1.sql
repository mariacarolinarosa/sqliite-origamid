--database: ./db.sqlite

CREATE TABLE users_json(
    id INTEGER PRIMARY KEY,
    email TEXT NOT NULL UNIQUE
)STRICT;

CREATE TABLE users_config(
    user_json_id INTEGER PRIMARY KEY REFERENCES users_json(id) ON DELETE CASCADE,
    config TEXT NOT NULL CHECK(json_valid(config))
)STRICT;

INSERT INTO users_json(email) VALUES ('andre@origamid.com'), ('maria@origamid.com');

INSERT INTO users_config (config)
VALUES  (json('{"vídeo": 1, "speed": 2.5, "font":"monospace"}')),
        (json('{"vídeo": 2, "speed": 1, "font":"arial"}'));

INSERT INTO users_json(email) VALUES ('mayara@origamid.com');

INSERT INTO users_config(config) VALUES (json_object('vídeo',2,'speed', 1, 'font', 'arial'));


SELECT * FROM users_json as uj
JOIN users_config as uc
ON uj.id = uc.user_json_id;