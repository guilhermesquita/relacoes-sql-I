-- Active: 1674150409153@@127.0.0.1@3306
-- Práticas
CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
);

DROP TABLE users;

CREATE TABLE phones(
    id TEXT PRIMARY KEY NOT NULL UNIQUE,
    phone_number TEXT UNIQUE NOT NULL,
    user_id TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id) --REFERENCIANDO A CHAVE ESTRANGEIRA
);

DROP TABLE phone;

INSERT INTO users(id, name, email, password)
VALUES('A01', 'Guilherme', 'guirozmesquita@gmail.com', '8503Ac.'),
      ('A02', 'Maria', 'maria@labenu.com', 'fufs_123');

SELECT * FROM users;

INSERT INTO phones(id, phone_number, user_id)
VALUES('P001', '+559299917756', 'A01'),
      ('P002', '+559291937836', 'A02'),
      ('P003', '+559291912145', 'A01');

--QUERY QUE JUNTA AS INFORMAÇÕES DAS TABELAS JUNTAS
SELECT users.id AS id_user, users.name, users.email, users.password, phones.id as id_phone, phones.phone_number FROM users
INNER JOIN phones
ON phones.user_id = users.id;


------------PRATICA 02---------------
CREATE TABLE licenses(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    register_number TEXT NOT NULL UNIQUE,
    category TEXT NOT NULL
);

CREATE TABLE drivers(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    license_id TEXT NOT NULL UNIQUE,
    FOREIGN KEY(license_id) REFERENCES licenses (id)
);

INSERT INTO licenses(id, register_number, category)
VALUES('1a2b3c', '123', 'A'),
      ('2b3v4d', '362', 'AB');

INSERT INTO drivers(id, name, email, password, license_id)
VALUES('DV01', 'Julio','driver@email.com', '1242f_', '1a2b3c'),
      ('DV02', 'Rebeca','email@labenu.com', '183kf_lbn', '2b3v4d');

SELECT drivers.id AS id_DRIVER, drivers.name, drivers.email, drivers.password, drivers.license_id,
licenses.id AS id_license, licenses.register_number, licenses.category FROM drivers
INNER JOIN licenses
ON drivers.license_id = licenses.id