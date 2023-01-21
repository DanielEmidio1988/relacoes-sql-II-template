-- Active: 1674225389182@@127.0.0.1@3306

-- Práticas
-- Crie a tabela users
CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL, 
    name TEXT NOT NULL, 
    email TEXT NOT NULL UNIQUE, 
    password TEXT NOT NULL, 
    created_at TEXT DEFAULT(DATETIME('now', 'localtime')) NOT NULL);

    SELECT * FROM users;

    SELECT DATETIME('now', 'localtime');

    DROP TABLE users;

-- Popule a tabela com ao menos 3 pessoas

INSERT INTO users (id,name,email,password)
VALUES ("u001","Daniel","daniel@teste.com", "123456"),
("u002","Cassia","cassia@teste.com","123455"),
("u003","Cristiano","cristiano@teste.com", "123457");

DELETE FROM users;

-- Criando a tabela de relações

CREATE TABLE follows (
    follower_id TEXT NOT NULL, 
    followed_id TEXT NOT NULL,
    FOREIGN KEY (follower_id) REFERENCES users (id),
    FOREIGN KEY (followed_id) REFERENCES users (id));

SELECT * FROM follows;


INSERT INTO follows (follower_id, followed_id)
VALUES ("u001", "u002"),
("u001", "u003"),
("u002", "u001");

SELECT * FROM users
INNER JOIN follows
ON follows.follower_id = users.id
;

SELECT * FROM users
LEFT JOIN follows
ON follows.follower_id = users.id
INNER JOIN users AS userFollowed
ON follows.followed_id = userFollowed.id
;

-- Removendo ambiguidades
SELECT 
users.id AS usersId,
users.name,
users.email, 
users.password,
users.created_at AS created_at, 
follows.follower_id AS followedId,
follows.followed_id AS followedId,
userFollowed.name AS nameFollowed
 FROM users
LEFT JOIN follows
ON follows.follower_id = users.id
INNER JOIN users AS userFollowed
ON follows.followed_id = userFollowed.id
;


