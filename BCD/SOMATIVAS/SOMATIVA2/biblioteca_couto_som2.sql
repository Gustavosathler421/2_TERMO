-- 1. Criação do banco
CREATE DATABASE biblioteca_couto_som2

DROP DATABASE IF EXISTS biblioteca_couto_som2

USE biblioteca_couto_som2

-- 2. Tabela USUARIO
CREATE TABLE USUARIO (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    ativo BOOLEAN DEFAULT TRUE
);

-- 3. Tabela LIVRO

CREATE TABLE LIVRO (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(120) NOT NULL,
    isbn CHAR(13) NOT NULL UNIQUE,
    ano_publicacao INT NOT NULL,
    quantidade_disponivel INT DEFAULT 0 CHECK (quantidade_disponivel >= 0)
);

-- 4. Tabela EMPRESTIMO

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

--Extra: 2 tabelas Novas


CREATE TABLE CATEGORIA (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE,
    descricao VARCHAR(200)
);

CREATE TABLE RESERVA (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    data_reserva DATETIME DEFAULT CURRENT_TIMESTAMP,
    status_reserva VARCHAR(20) DEFAULT 'ABERTA'
        CHECK (status_reserva IN ('ABERTA', 'CANCELADA', 'CONCLUIDA')),
    id_usuario INT,
    id_livro INT,
    FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario),
    FOREIGN KEY (id_livro) REFERENCES LIVRO(id_livro)
);

-- 5. ALTER TABLE

ALTER TABLE livro
ADD COLUMN editora VARCHAR(100);

--Fase 2:

-- 6. INSERT de usuários

INSERT INTO USUARIO (nome, email, telefone, ativo) VALUES
('Pedro Luis', 'vroom@email.com', '199999999002', TRUE),
('Bruno Souza', 'cronos@email.com', '199999999003', TRUE),
('Sarah Lemes', 'lemouska@email.com', '199999999007', TRUE),
('Thiago chumbim', 'chumbim@email.com', NULL, TRUE);

-- 7. INSERT de livros

INSERT INTO LIVRO (titulo, autor, isbn, ano_publicacao, quantidade_disponivel, editora) VALUES
('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', '9788522031412', 1943, 8, 'HarperCollins'),
('O Senhor dos Anéis', 'J.R.R. Tolkien', '9788551005736', 1954, 4, 'HarperCollins'),
('Harry Potter e a Pedra Filosofal', 'J.K. Rowling', '9788532511010', 1997, 5, 'Rocco'),
('Dom Quixote', 'Miguel de Cervantes', '9788520932599', 1605, 2, 'Nova Fronteira'),
('A Biblioteca da Meia-Noite', 'Matt Haig', '9786558380542', 2020, 3, 'Bertrand Brasil'),
('Lições de Química', 'Bonnie Garmus', '9786555605945', 2022, 1, 'Intrínseca');

-- 8. INSERT de empréstimos

INSERT INTO EMPRESTIMO (data_prevista, id_usuario, id_livro) VALUES
('2026-11-10', 1, 1),
('2026-11-12', 2, 3),
('2026-11-15', 3, 4);

-- 9. UPDATE

SELECT * FROM USUARIO WHERE email = 'chumbim@email.com';

UPDATE USUARIO 
SET telefone = '199888888004' 
WHERE id_usuario = 4;

-- 10. Atualização em lote

UPDATE LIVRO
SET quantidade_disponivel = quantidade_disponivel + 2
WHERE ano_publicacao >= 2020;

-- 11. DELETE e integridade

INSERT INTO USUARIO (nome, email, telefone)
VALUES ('Chrystian', 'burro@email.com', NULL);
DELETE FROM USUARIO
WHERE email = 'vroom@email.com';

-- A tentativa de excluir o usuário com empréstimo vai falhou e o banco de dados retornou um erro de violação de chave estrangeira. Isso ocorreu porque o usuário id_usuario = 1 possui registros de empréstimo atrelados a ele, o MySQL impede a sua exclusão.

-- Fase 3:

-- 12. SELECT básico

SELECT titulo, autor, quantidade_disponivel
FROM LIVRO;

-- 13. WHERE + ORDER BY
SELECT titulo, quantidade_disponivel 
FROM LIVRO 
WHERE quantidade_disponivel > 2 
ORDER BY quantidade_disponivel DESC;

-- 14. LIKE
SELECT id_livro, titulo, autor 
FROM LIVRO 
WHERE titulo LIKE 'Harry%';

-- 15. BETWEEN

SELECT titulo, ano_publicacao
FROM LIVRO
WHERE ano_publicacao BETWEEN 2015 AND 2025;


-- 16. Funções agregadas

SELECT
    COUNT(*) AS total_livros,
    SUM(quantidade_disponivel) AS soma_estoque,
    AVG(quantidade_disponivel) AS media_estoque,
    MIN(quantidade_disponivel) AS menor_estoque,
    MAX(quantidade_disponivel) AS maior_estoque
FROM LIVRO;


-- 17. INNER JOIN

SELECT
    EMPRESTIMO.id_emprestimo,
    USUARIO.nome,
    LIVRO.titulo,
    EMPRESTIMO.data_emprestimo,
    EMPRESTIMO.status_emprestimo
FROM EMPRESTIMO
INNER JOIN USUARIO
ON EMPRESTIMO.id_usuario = USUARIO.id_usuario
INNER JOIN LIVRO
ON EMPRESTIMO.id_livro = LIVRO.id_livro;

-- 18. JOIN + WHERE

SELECT USUARIO.nome, LIVRO.titulo,
       EMPRESTIMO.status_emprestimo
FROM EMPRESTIMO
INNER JOIN USUARIO
ON EMPRESTIMO.id_usuario = USUARIO.id_usuario
INNER JOIN LIVRO
ON EMPRESTIMO.id_livro = LIVRO.id_livro
WHERE EMPRESTIMO.status_emprestimo = 'ABERTO';

-- 19. GROUP BY

SELECT USUARIO.nome,
       COUNT(EMPRESTIMO.id_emprestimo) AS total_emprestimos
FROM USUARIO
INNER JOIN EMPRESTIMO
ON USUARIO.id_usuario = EMPRESTIMO.id_usuario
GROUP BY USUARIO.id_usuario, USUARIO.nome
ORDER BY total_emprestimos DESC;

-- 20. LEFT JOIN

SELECT USUARIO.nome,
       COUNT(EMPRESTIMO.id_emprestimo) AS total_emprestimos
FROM USUARIO
LEFT JOIN EMPRESTIMO
ON USUARIO.id_usuario = EMPRESTIMO.id_usuario
GROUP BY USUARIO.id_usuario, USUARIO.nome
ORDER BY total_emprestimos DESC;
