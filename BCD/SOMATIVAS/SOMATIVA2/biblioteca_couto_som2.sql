CREATE DATABASE biblioteca_couto_som2

DROP DATABASE IF EXISTS biblioteca_couto_som2

USE biblioteca_couto_som2

CREATE TABLE USUARIO (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE LIVRO (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(120) NOT NULL,
    isbn CHAR(13) NOT NULL UNIQUE,
    ano_publicacao INT NOT NULL,
    quantidade_disponivel INT DEFAULT 0 CHECK (quantidade_disponivel >= 0)
);

CREATE TABLE EMPRESTIMO (
    id_emprestimo INT PRIMARY KEY AUTO_INCREMENT,
    data_emprestimo DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATE NOT NULL,
    data_devolucao DATE,
    status_emprestimo VARCHAR(20) DEFAULT 'ABERTO' CHECK (status_emprestimo IN ('ABERTO', 'DEVOLVIDO', 'ATRASADO')),
    id_usuario INT,
    id_livro INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro)
);

ALTER TABLE livro
ADD COLUMN editora VARCHAR(100);

--Fase 2:

INSERT INTO USUARIO (nome, email, telefone, ativo) VALUES
('Pedro Luis', 'vroom@email.com', '199999999002', TRUE),
('Bruno Souza', 'cronos@email.com', '199999999003', TRUE),
('Sarah Lemes', 'lemouska@email.com', '199999999007', TRUE),
('Thiago chumbim', 'chumbim@email.com', NULL, TRUE);

INSERT INTO LIVRO (titulo, autor, isbn, ano_publicacao, quantidade_disponivel, editora) VALUES
('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', '9788522031412', 1943, 8, 'HarperCollins'),
('O Senhor dos Anéis', 'J.R.R. Tolkien', '9788551005736', 1954, 4, 'HarperCollins'),
('Harry Potter e a Pedra Filosofal', 'J.K. Rowling', '9788532511010', 1997, 5, 'Rocco'),
('Dom Quixote', 'Miguel de Cervantes', '9788520932599', 1605, 2, 'Nova Fronteira'),
('A Biblioteca da Meia-Noite', 'Matt Haig', '9786558380542', 2020, 3, 'Bertrand Brasil'),
('Lições de Química', 'Bonnie Garmus', '9786555605945', 2022, 1, 'Intrínseca');

INSERT INTO EMPRESTIMO (data_prevista, id_usuario, id_livro) VALUES
('2026-11-10', 1, 1),
('2026-11-12', 2, 3),
('2026-11-15', 3, 4);


SELECT * FROM USUARIO WHERE email = 'chumbim@email.com';

UPDATE USUARIO 
SET telefone = '199888888004' 
WHERE id_usuario = 4;

