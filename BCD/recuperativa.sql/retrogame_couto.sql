-- Active: 1794917651127@@127.0.0.1@3308@recuperativa_retrogame_couto
DROP DATABASE RECUPERATIVA_RETROGAME_COUTO;
-- 1. CRIAR E SELECIONAR O BANCO
CREATE DATABASE IF NOT EXISTS RECUPERATIVA_RETROGAME_COUTO;
USE RECUPERATIVA_RETROGAME_COUTO;

-- 2. Tabela CLIENTE
CREATE TABLE CLIENTE (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

-- 3. Tabelas PLATAFORMA e CATEGORIA
CREATE TABLE PLATAFORMA (
    id_plataforma INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE CATEGORIA (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(80) NOT NULL UNIQUE
);

-- 4. Tabela JOGO
CREATE TABLE JOGO (
    id_jogo INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    codigo VARCHAR(15) NOT NULL UNIQUE,
    ano_lancamento INT NOT NULL,
    quantidade_disponivel INT NOT NULL DEFAULT 0 CHECK (quantidade_disponivel >= 0),
    id_plataforma INT NOT NULL,
    id_categoria INT NOT NULL,
    CONSTRAINT fk_jogo_plataforma FOREIGN KEY (id_plataforma)
        REFERENCES PLATAFORMA(id_plataforma),
    CONSTRAINT fk_jogo_categoria FOREIGN KEY (id_categoria)
        REFERENCES CATEGORIA(id_categoria)
);

-- 5. Tabela LOCAÇÃO
CREATE TABLE LOCACAO (
    id_locacao INT PRIMARY KEY AUTO_INCREMENT,
    data_retirada DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATE NOT NULL,
    data_devolucao DATE NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'ABERTA',
    id_cliente INT NOT NULL,
    id_jogo INT NOT NULL,
    CONSTRAINT chk_locacao_status
        CHECK (status IN ('ABERTA', 'DEVOLVIDA', 'ATRASADA')),
    CONSTRAINT fk_locacao_cliente FOREIGN KEY (id_cliente)
        REFERENCES CLIENTE(id_cliente) ON DELETE RESTRICT,
    CONSTRAINT fk_locacao_jogo FOREIGN KEY (id_jogo)
        REFERENCES JOGO(id_jogo) ON DELETE RESTRICT
);

-- 6. ALTER TABLE 
ALTER TABLE JOGO
ADD COLUMN desenvolvedora VARCHAR(100);

-- FASE 2 - DML: MANIPULACAO DE DADOS

-- 7. Inserir clientes (um deles com telefone NULL)
INSERT INTO CLIENTE (nome, email, telefone) VALUES
('Thiago Chumbim', 'helrbitz@email.com', '19990001111'),
('Gustavo Couto', 'corujao@email.com', NULL),
('João Victor', 'cronos@email.com', '19990003333'),
('Pedro Luis de Souza', 'Vroom@email.com', '19990004444');

-- 8. Inserir plataformas, categorias e jogos
INSERT INTO PLATAFORMA (nome) VALUES
('PlayStation 1'), -- Ajustado para evitar duplicidade com o ID 3 (PS2)
('Nintendo 64'),
('PlayStation 2');

INSERT INTO CATEGORIA (descricao) VALUES
('Aventura'),
('Acao');

INSERT INTO JOGO
(titulo, codigo, ano_lancamento, quantidade_disponivel, id_plataforma, id_categoria, desenvolvedora)
VALUES
('Crash Twinsanity', 'PS2-001', 2004, 5, 3, 1, 'Traveller''s Tales'),
('God of War', 'PS2-002', 2005, 4, 3, 2, 'Santa Monica Studio'),
('Ben 10: Protector of Earth', 'PS2-003', 2007, 3, 3, 2, 'High Voltage Software'),
('Super Mario 64', 'N64-001', 1996, 6, 2, 1, 'Nintendo'),
('The Legend of Zelda Ocarina of Time', 'N64-002', 1998, 2, 2, 1, 'Nintendo'),
('Resident Evil 4', 'PS2-004', 2005, 3, 3, 2, 'Capcom');


