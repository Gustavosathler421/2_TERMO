
-- BANCO DE DADOS DA OFICINA MECÂNICA

CREATE DATABASE oficina_mecanica;

USE oficina_mecanica;

-- 1. CLIENTES
-- CLIENTES 1:N VEÍCULOS
-- CLIENTES 1:N SERVIÇOS

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR(100),
    endereco VARCHAR(150)
);


-- 2. FUNCIONÁRIOS
-- VEÍCULOS 1:N ORDENS DE SERVIÇO

CREATE TABLE funcionarios (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    cargo VARCHAR(50) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    salario DECIMAL(10,2) NOT NULL
);

-- 3. MARCAS

CREATE TABLE marcas (
    id_marca INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE,
    pais_origem VARCHAR(50),
    ano_fundacao YEAR,
    categoria VARCHAR(50),
    status VARCHAR(20) NOT NULL
);


-- 4. FORNECEDORES
-- Relação: FORNECEDORES 1:N PEÇAS

CREATE TABLE fornecedores (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(120) NOT NULL,
    cnpj VARCHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR(100),
    endereco VARCHAR(150) NOT NULL
);

-- 5. MODELOS

CREATE TABLE modelos (
    id_modelo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    ano_lancamento YEAR NOT NULL,
    potencia VARCHAR(20),
    carroceria VARCHAR(30),
    id_marca INT NOT NULL,

    FOREIGN KEY (id_marca)
        REFERENCES marcas(id_marca)
);

-- RENOMEANDO MODELOS PARA MODELOS_FAB

RENAME TABLE modelos TO modelos_fab;


-- 6. VEÍCULOS
-- Relações:
-- CLIENTES 1:N VEÍCULOS
-- MODELOS 1:N VEÍCULOS


CREATE TABLE veiculos (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(7) NOT NULL UNIQUE,
    cor VARCHAR(30) NOT NULL,
    ano YEAR NOT NULL,
    quilometragem INT NOT NULL,
    combustivel VARCHAR(20) NOT NULL,
    id_cliente INT NOT NULL,
    id_modelo INT NOT NULL,

    FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente),

    FOREIGN KEY (id_modelo)
        REFERENCES modelos_fab(id_modelo)
);



-- 7. SERVIÇOS


CREATE TABLE servicos (
    id_servico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    preco DECIMAL(10,2) NOT NULL,
    duracao INT NOT NULL,
    status VARCHAR(20) NOT NULL
);


-- 8. ORDENS DE SERVIÇO
-- Relações:
-- VEÍCULOS 1:N ORDENS DE SERVIÇO
-- FUNCIONÁRIOS 1:N ORDENS DE SERVIÇO


CREATE TABLE ordens_servico (
    id_ordem INT AUTO_INCREMENT PRIMARY KEY,
    data_abertura DATE NOT NULL,
    data_conclusao DATE,
    descricao_problema VARCHAR(255) NOT NULL,
    status VARCHAR(30) NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    id_veiculo INT NOT NULL,
    id_funcionario INT NOT NULL,

    FOREIGN KEY (id_veiculo)
        REFERENCES veiculos(id_veiculo),

    FOREIGN KEY (id_funcionario)
        REFERENCES funcionarios(id_funcionario)
);

-- 9. PEÇAS
-- Relação: FORNECEDORES 1:N PEÇAS

CREATE TABLE pecas (
    id_peca INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    preco DECIMAL(10,2) NOT NULL,
    quantidade INT NOT NULL,
    localizacao VARCHAR(50),
    id_fornecedor INT NOT NULL,

    FOREIGN KEY (id_fornecedor)
        REFERENCES fornecedores(id_fornecedor)
);

-- 10. PAGAMENTOS

CREATE TABLE pagamentos (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    valor DECIMAL(10,2) NOT NULL,
    data_pagamento DATE NOT NULL,
    forma_pagamento VARCHAR(30) NOT NULL,
    status VARCHAR(20) NOT NULL,
    parcelas INT NOT NULL
);

-- ADICIONAR UM CAMPO NOVO EM CADA TABELA

ALTER TABLE clientes
ADD COLUMN teste VARCHAR(50);

ALTER TABLE funcionarios
ADD COLUMN teste VARCHAR(50);

ALTER TABLE marcas
ADD COLUMN teste VARCHAR(50);

ALTER TABLE fornecedores
ADD COLUMN teste VARCHAR(50);

ALTER TABLE modelos_fab
ADD COLUMN teste VARCHAR(50);

ALTER TABLE veiculos
ADD COLUMN teste VARCHAR(50);

ALTER TABLE servicos
ADD COLUMN teste VARCHAR(50);

ALTER TABLE ordens_servico
ADD COLUMN teste VARCHAR(50);

ALTER TABLE pecas
ADD COLUMN teste VARCHAR(50);

ALTER TABLE pagamentos
ADD COLUMN teste VARCHAR(50);

-- APAGAR O CAMPO NOVO

ALTER TABLE clientes
DROP COLUMN teste;

ALTER TABLE funcionarios
DROP COLUMN teste;

ALTER TABLE marcas
DROP COLUMN teste;

ALTER TABLE fornecedores
DROP COLUMN teste;

ALTER TABLE modelos_fab
DROP COLUMN teste;

ALTER TABLE veiculos
DROP COLUMN teste;

ALTER TABLE servicos
DROP COLUMN teste;

ALTER TABLE ordens_servico
DROP COLUMN teste;

ALTER TABLE pecas
DROP COLUMN teste;

ALTER TABLE pagamentos
DROP COLUMN teste;
