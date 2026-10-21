-- Active: 1788351682083@@127.0.0.1@3306@smartcoffee_dml_couto


-- ============================================================
-- AULA 08 - ATIVIDADE PRÁTICA DE DML
-- Nome: 
-- Turma: DEVIES2T  Data: 30/09/2026
-- Base: smartcoffee_dml_couto
-- ============================================================


-- IMPORTANTE:
-- Para toda questão de UPDATE ou DELETE, escreva primeiro um SELECT
-- com o mesmo WHERE para validar os registros afetados.



-- PARTE A - INSERT

-- 1. Cadastre dois novos clientes com dados diferentes.


INSERT INTO cliente (nome, email, telefone, cidade, ativo)
VALUES
('Carlos Oliveira', 'carlos@email.com', '19988880001', 'Campinas', TRUE),
('Mariana Santos', 'mariana@email.com', '19988880002', 'Limeira', TRUE);


SELECT * FROM cliente
WHERE email IN ('carlos@email.com', 'mariana@email.com');



-- 2. Cadastre a categoria 'Especiais da Casa'.
INSERT INTO categoria (nome)
VALUES ('Especiais da Casa');


-- 3. Localize o id da categoria criada e cadastre três produtos nela.

SELECT * FROM categoria
WHERE nome = 'Especiais da Casa';

SET @categoria = LAST_INSERT_ID();

INSERT INTO produto (nome,preco,ativo,id_categoria) VALUES
('Café Especial',15.00,TRUE,@categoria),
('Capuccino Especial',18.00,TRUE,@categoria),
('Chocolate Especial',12.00,TRUE,@categoria);


-- 4. Cadastre um terceiro cliente sem telefone.
INSERT INTO cliente (nome,email,telefone,cidade,ativo) VALUES
('Pedro Almeida','pedro@email.com',NULL,'Campinas',TRUE);

-- 5. Crie um novo pedido para um dos clientes cadastrados.
INSERT INTO pedido (data_pedido,status,valor_total,id_cliente) VALUES
(NOW(),'ABERTO',0.00,
(SELECT id_cliente FROM cliente
WHERE email = 'carlos@email.com'));
SET @pedido_atividade = LAST_INSERT_ID();


-- 6. Use LAST_INSERT_ID() para guardar o id do pedido em @pedido_atividade
--    e insira pelo menos dois itens nesse pedido.
INSERT INTO item_pedido
(id_pedido,id_produto,quantidade,preco_unitario) VALUES
(@pedido_atividade,1,2,7.00),
(@pedido_atividade,2,1,10.00);


-- PARTE B - UPDATE

-- 7. Corrija o telefone de um dos clientes criados.
-- SELECT de validação:
-- UPDATE:
-- SELECT final:
SELECT * FROM cliente
WHERE email = 'carlos@email.com';

UPDATE cliente
SET telefone = '19988889999'
WHERE email = 'carlos@email.com';

SELECT * FROM cliente
WHERE email = 'carlos@email.com';

-- 8. Altere cidade e telefone de outro cliente em um único UPDATE.

SELECT * FROM cliente
WHERE email = 'mariana@email.com';

UPDATE cliente
SET telefone = '19977778888',
    cidade = 'Piracicaba'
WHERE email = 'mariana@email.com';

SELECT * FROM cliente
WHERE email = 'mariana@email.com';

-- 9. Aumente em 8% o preço dos produtos da categoria 'Especiais da Casa'.

SELECT * FROM produto
WHERE id_categoria = @categoria;

UPDATE produto
SET preco = preco * 1.08
WHERE id_categoria = @categoria;

SELECT * FROM produto
WHERE id_categoria = @categoria;

-- 10. Altere o status do pedido criado para 'PREPARANDO'.

SELECT * FROM pedido
WHERE id_pedido = @pedido_atividade;

UPDATE pedido
SET status = 'PREPARANDO'
WHERE id_pedido = @pedido_atividade;

SELECT * FROM pedido
WHERE id_pedido = @pedido_atividade;

-- 11. Atualize valor_total do pedido de acordo com os itens cadastrados.
--     Você pode calcular previamente com SELECT SUM(quantidade * preco_unitario).
SELECT SUM(quantidade * preco_unitario) AS total
FROM item_pedido
WHERE id_pedido = @pedido_atividade;

UPDATE pedido
SET valor_total = (
    SELECT SUM(quantidade * preco_unitario)
    FROM item_pedido
    WHERE id_pedido = @pedido_atividade
)
WHERE id_pedido = @pedido_atividade;

SELECT * FROM pedido
WHERE id_pedido = @pedido_atividade;

-- 12. Escolha um dos produtos criados e faça uma exclusão lógica (ativo = FALSE).

SELECT * FROM produto
WHERE nome = 'Chocolate Especial';

UPDATE produto
SET ativo = FALSE
WHERE nome = 'Chocolate Especial';

SELECT * FROM produto
WHERE nome = 'Chocolate Especial';


-- PARTE C - DELETE

-- 13. Crie um cliente de teste sem pedidos.
--     Depois localize e exclua apenas esse cliente.

INSERT INTO cliente (nome,email,telefone,cidade,ativo) VALUES
('Cliente Teste','teste@email.com','199000000','Campinas',TRUE);

SELECT * FROM cliente
WHERE email = 'teste@email.com';

DELETE FROM cliente
WHERE email = 'teste@email.com';

SELECT * FROM cliente
WHERE email = 'teste@email.com';


-- 14. Tente excluir um cliente da base original que possua pedidos.
--     Deixe o DELETE comentado após o teste e descreva o erro abaixo.
-- Resultado observado:
SELECT * FROM cliente
WHERE id_cliente = 1;

SELECT * FROM pedido
WHERE id_cliente = 1;

-- DELETE FROM cliente
-- WHERE id_cliente = 1;

-- Erro: o cliente possui pedidos relacionados.


-- 15. Explique em comentário por que a FK bloqueou a exclusão.
-- Resposta: A FK impediu de apagar o cliente porque existem pedidos ligados a ele.


-- 16. Crie uma categoria temporária chamada 'Excluir Depois' e remova-a.
INSERT INTO categoria (nome)
VALUES ('Excluir Depois');

SELECT * FROM categoria
WHERE nome = 'Excluir Depois';

DELETE FROM categoria
WHERE nome = 'Excluir Depois';

SELECT * FROM categoria
WHERE nome = 'Excluir Depois';

-- PARTE D - INTEGRIDADE E ERROS CONTROLADOS
-- Execute uma tentativa por vez. Depois deixe o comando problemático comentado.

--- 17. Produto com categoria inexistente
-- Qual restrição impediu a operação?
-- FOREIGN KEY impediu a operação.
-- INSERT INTO produto (nome, preco, ativo, id_categoria)
-- VALUES ('Café Teste', 10.00, TRUE, 9999);


-- 18. Tente cadastrar um cliente usando 'ana@email.com'.
-- Qual restrição impediu a operação?
-- UNIQUE impediu a operação.

-- INSERT INTO cliente (nome, email, telefone, cidade, ativo)
-- VALUES ('Ana Teste', 'ana@email.com', '1999999999', 'Limeira', TRUE);

-- 19. Tente criar um pedido com id_cliente = 9999.
-- Qual restrição impediu a operação?
-- FOREIGN KEY impediu a operação.

-- INSERT INTO pedido (data_pedido, status, valor_total, id_cliente)
-- VALUES ('2026-10-14 10:00:00', 'ABERTO', 20.00, 9999);


-- 20. Escreva em comentários a diferença entre os três erros anteriores.

-- 17: Categoria inexistente (FOREIGN KEY).
-- 18: E-mail duplicado (UNIQUE).
-- 19: Cliente inexistente (FOREIGN KEY).




-- PARTE E - DESAFIO COMPLETO COM TRANSAÇÃO

-- 21. Inicie uma transação.
START TRANSACTION;

-- 22. Dentro dela, cadastre um cliente, um pedido e dois itens relacionados.

INSERT INTO cliente (nome, email, telefone, cidade, ativo)
VALUES ('Carlos Teste', 'carlos_teste@email.com',
'1999999000', 'Limeira', TRUE);

SET @cliente = LAST_INSERT_ID();

INSERT INTO pedido (data_pedido, status, valor_total, id_cliente)
VALUES ('2026-10-14 10:00:00', 'ABERTO', 17.00, @cliente);

SET @pedido = LAST_INSERT_ID();

INSERT INTO item_pedido
(id_pedido, id_produto, quantidade, preco_unitario)
VALUES
(@pedido, 1, 1, 7.00),
(@pedido, 2, 1, 10.00);

-- 23. Faça uma consulta com JOIN comprovando que os registros existem
--     enquanto a transação está aberta.

-- 24. Execute ROLLBACK e depois use SELECT para provar que o cadastro foi desfeito.
ROLLBACK;
SELECT *
FROM cliente
WHERE email = 'carlos_teste@email.com';


-- 25. Repita o processo com novos dados e finalize usando COMMIT.
--     Depois consulte os registros persistidos. START TRANSACTION;

INSERT INTO CLIENTE (NOME, EMAIL, TELEFONE, CIDADE, ATIVO)
VALUES ('PEDRO TESTE', 'pedro_teste@email.com',
'1999999111', 'AMERICANA', TRUE);

SET @CLIENTE = LAST_INSERT_ID();

INSERT INTO PEDIDO (DATA_PEDIDO, STATUS, VALOR_TOTAL, ID_CLIENTE)
VALUES ('2026-10-21 11:00:00', 'ABERTO', 17.00, @CLIENTE);

SET @PEDIDO = LAST_INSERT_ID();

INSERT INTO ITEM_PEDIDO
(ID_PEDIDO, ID_PRODUTO, QUANTIDADE, PRECO_UNITARIO)
VALUES
(@PEDIDO, 1, 1, 7.00),
(@PEDIDO, 2, 1, 10.00);

COMMIT;

SELECT C.NOME AS CLIENTE, P.ID_PEDIDO,
PR.NOME AS PRODUTO, IP.QUANTIDADE, IP.PRECO_UNITARIO
FROM CLIENTE AS C
INNER JOIN PEDIDO AS P
ON P.ID_CLIENTE = C.ID_CLIENTE
INNER JOIN ITEM_PEDIDO AS IP
ON IP.ID_PEDIDO = P.ID_PEDIDO
INNER JOIN PRODUTO AS PR
ON PR.ID_PRODUTO = IP.ID_PRODUTO
WHERE C.EMAIL = 'pedro_teste@email.com';

-- DESAFIO EXTRA
-- 26. Escolha uma situação realista do SmartCoffee que exija INSERT + UPDATE
--     ou UPDATE + DELETE lógico. Descreva a regra de negócio e implemente.
