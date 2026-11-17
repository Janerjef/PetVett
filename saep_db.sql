PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS agendamentos;
DROP TABLE IF EXISTS pets;
DROP TABLE IF EXISTS tutores;
DROP TABLE IF EXISTS usuarios;

CREATE TABLE usuarios (
    id      INTEGER PRIMARY KEY AUTOINCREMENT,
    nome    VARCHAR(100) NOT NULL,
    login   VARCHAR(50)  NOT NULL UNIQUE,
    senha   VARCHAR(200) NOT NULL
);

CREATE TABLE tutores (
    id        INTEGER PRIMARY KEY AUTOINCREMENT,
    nome      VARCHAR(100) NOT NULL,
    cpf       VARCHAR(200) NOT NULL,
    telefone  VARCHAR(20),
    email     VARCHAR(100)
);

CREATE TABLE pets (
    id               INTEGER PRIMARY KEY AUTOINCREMENT,
    nome             VARCHAR(50) NOT NULL,
    especie          VARCHAR(30) NOT NULL,
    raca             VARCHAR(50),
    data_nascimento  DATE,
    tutor_id         INTEGER NOT NULL,
    FOREIGN KEY (tutor_id) REFERENCES tutores(id)
);

CREATE TABLE agendamentos (
    id                INTEGER PRIMARY KEY AUTOINCREMENT,
    pet_id            INTEGER NOT NULL,
    data_agendamento  DATETIME NOT NULL,
    servico           VARCHAR(100) NOT NULL,
    status            VARCHAR(20) NOT NULL DEFAULT 'Agendado',
    FOREIGN KEY (pet_id) REFERENCES pets(id)
);

INSERT INTO usuarios (nome, login, senha) VALUES
('Administrador','admin','581c39d98fe224d04c1e5b189a979baa:1aa5f171a973fee298f75bfd59c23b5392da1d3a9c982dbda3ce9d28e348e526'),
('Dra. Camila Souza','camila','de23c49b5a182acb93434a1991a6bb82:965356ecc440f38461cf20e2ea84c3f9c088239d8efcc91a54d8b2bc3367d1ed'),
('Recepção','recepcao', '979e7b369feb4eb1cf22490676f49a78:387a6b3fc5c8bddb809f47c588ed403c54920888ad75a7754ce11ca1380d59ca');

INSERT INTO tutores (nome, cpf, telefone, email) VALUES
('Rafael Nunes Barbosa', '5d19c7e4bd5113ac0b112398ad7478f9:4264c561b4f2bc794df59cc53470867a61f359338db361b0302769495e1f3c16', '(71) 98812-4477', 'rafael.barbosa@email.com'),
('Simone Teixeira', '31373e8feaa3fefea5cb6f4a9ad78767:45965103d1f0a628435f442252bd31931088584d9b7160f2dd1ece0b6e632af6', '(71) 98220-9931', 'simone.teixeira@email.com'),
('Diego Fontes', 'f8561d9af1793c3b6d0ac18359ecb64a:a87ec6a4a65d480e5a23d36095d2190696b3b6b66e4e877a7c87675c1fc85df8', '(71) 99643-2020', 'diego.fontes@email.com'),
('Patrícia Moura', '4b4e8fd7370c610d2b1f999aef84507f:e3351c11d11acac66cba8336543a9ab9ff480fa485b1966bc61d58ad372937fc', '(71) 98177-6644', 'patricia.moura@email.com');

INSERT INTO pets (nome, especie, raca, data_nascimento, tutor_id) VALUES
('Fumaça', 'Gato','Sem raça definida', '2021-09-08', 2),
('Bento',  'Cachorro','Beagle','2018-04-22', 1),
('Kiara',  'Cachorro','Pastor-alemão','2022-06-30', 3),
('Pipoca', 'Gato','Maine Coon','2023-02-14', 2),
('Jade','Calopsita', 'Lutino','2024-01-19', 4);

INSERT INTO agendamentos (pet_id, data_agendamento, servico, status) VALUES
(2, '2026-11-19T08:00', 'Consulta dermatológica','Agendado'),
(3, '2026-11-21T16:30', 'Castração','Agendado'),
(5, '2026-11-27T13:15', 'Consulta aviária','Agendado'),
(1, '2026-12-02T09:00', 'Vacinação polivalente','Agendado'),
(4, '2026-11-10T10:45', 'Limpeza dental','Concluído');
