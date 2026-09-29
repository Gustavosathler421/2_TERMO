-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Pedidos (
id_pedidos INT_AUTO_INCREMENT_PRIMARY KEY PRIMARY KEY,
Quantidade INT,
Id_Cliente INT_AUTO_INCREMENT_PRIMARY KEY
)

CREATE TABLE Produto+Estoque (
id_produto INT_AUTO_INCREMENT_PRIMARY KEY,
Nome_produto VARCHAR(100),
Valor Decimal(10,2),
id_Estoque INT_AUTO_INCREMENT_PRIMARY KEY,
PRIMARY KEY(id_produto,id_Estoque)
)

CREATE TABLE Clientes (
Nome_cliente INT(60),
Id_Cliente INT_AUTO_INCREMENT_PRIMARY KEY PRIMARY KEY
)

CREATE TABLE Fornecedores (
Razao_social VARCHAR(100),
id_fornecedor INT_AUTO_INCREMENT_PRIMARY KEY PRIMARY KEY
)

CREATE TABLE Produtos (
Nome_produto Texto(1),
Id_produto INT_AUTO_INCREMENT_PRIMARY KEY PRIMARY KEY
)

CREATE TABLE Item_produto (
Id_produto Int,
id_fornecedor Int,
id_item_produto INT_AUTO_INCREMENT_PRIMARY KEY PRIMARY KEY,
Quantidade Int)

ALTER TABLE Pedidos ADD FOREIGN KEY(Id_Cliente) REFERENCES Clientes (Id_Cliente)
