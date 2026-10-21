-- Active: 1788351682083@@127.0.0.1@3306@smartcoffee_dml_couto

-- ============================================================
-- AULA 09 - ATIVIDADE PRÁTICA DE DQL
-- Nome: 
-- Turma: DEVIES2T  Data: 07/10/2026
-- Base: smartcoffee_dml_couto
-- ============================================================
-- PARTE A - AQUECIMENTO

-- 1. Liste todos os clientes cadastrados.

SELECT *
FROM cliente;

-- 2. Exiba apenas nome, cidade e e-mail dos clientes.
SELECT nome, cidade, email
FROM cliente;

-- 3. Liste os nomes das cidades sem repetir valores.
SELECT DISTINCT cidade
FROM cliente;


-- 4. Liste todos os produtos em ordem crescente de preço.
SELECT nome, preco
FROM produto
ORDER BY preco ASC;


-- 5. Mostre apenas os 5 produtos mais caros.
SELECT nome, preco
FROM produto
ORDER BY preco DESC
LIMIT 5;

-- PARTE B - FILTROS

-- 6. Liste os produtos com preço entre R$ 8,00 e R$ 15,00.
SELECT nome, preco
FROM produto
WHERE preco BETWEEN 8.00 AND 15.00;

-- 7. Liste os clientes das cidades Limeira ou Americana.
SELECT nome, cidade
FROM cliente
WHERE cidade IN ('Limeira', 'Americana');

-- 8. Localize os produtos cujo nome contém a palavra “Café”.
SELECT nome
FROM produto
WHERE nome LIKE '%Café%';

-- 9. Liste os clientes que não informaram telefone.
SELECT nome, telefone
FROM cliente
WHERE telefone IS NULL;


-- 10. Mostre os pedidos FINALIZADOS com valor acima de R$ 20,00,
-- do maior para o menor valor.
SELECT id_pedido, data_pedido, valor_total
FROM pedido
WHERE status = 'FINALIZADO'
AND valor_total > 20.00
ORDER BY valor_total DESC;


-- PARTE C - CÁLCULOS E AGRUPAMENTOS

-- 11. Informe quantos produtos estão cadastrados.
SELECT COUNT(*) AS Total_Produtos
FROM produto;


-- 12. Mostre menor preço, maior preço e preço médio dos produtos.
SELECT MIN(preco) AS Menor_Preco,
       MAX(preco) AS Maior_Preco,
       AVG(preco) AS Preco_Medio
FROM produto;


-- 13. Informe quantos clientes existem em cada cidade.
SELECT cidade, COUNT(*) AS Quantidade_Clientes
FROM cliente
GROUP BY cidade;


-- 14. Mostre somente as cidades que possuem dois ou mais clientes.
SELECT cidade, COUNT(*) AS Quantidade_Clientes
FROM cliente
GROUP BY cidade
HAVING COUNT(*) >= 2;


-- 15. Calcule o faturamento total considerando apenas pedidos FINALIZADOS.
SELECT SUM(valor_total) AS Faturamento_Total
FROM pedido
WHERE status = 'FINALIZADO';

-- PARTE D - RELACIONAMENTOS

-- 16. Liste cada pedido exibindo id, data, nome do cliente, status e valor total.
SELECT P.ID_PEDIDO, P.DATA_PEDIDO, C.NOME AS CLIENTE,
P.STATUS, P.VALOR_TOTAL
FROM PEDIDO AS P
INNER JOIN CLIENTE AS C
ON C.ID_CLIENTE = P.ID_CLIENTE;

-- 17. Liste cada produto acompanhado do nome de sua categoria.
SELECT PR.NOME AS PRODUTO, CA.NOME AS CATEGORIA
FROM PRODUTO AS PR
INNER JOIN CATEGORIA AS CA
ON CA.ID_CATEGORIA = PR.ID_CATEGORIA;

-- 18. Gere um relatório dos itens vendidos: pedido, produto, quantidade,
--     preço unitário e subtotal.
SELECT P.ID_PEDIDO, PR.NOME AS PRODUTO, IP.QUANTIDADE,
IP.PRECO_UNITARIO,
IP.QUANTIDADE * IP.PRECO_UNITARIO AS SUBTOTAL
FROM PEDIDO AS P
INNER JOIN ITEM_PEDIDO AS IP
ON IP.ID_PEDIDO = P.ID_PEDIDO
INNER JOIN PRODUTO AS PR
ON PR.ID_PRODUTO = IP.ID_PRODUTO
ORDER BY P.ID_PEDIDO;


-- 19. Mostre todos os clientes, inclusive aqueles que nunca fizeram pedidos.
SELECT C.NOME AS CLIENTE, P.ID_PEDIDO, P.DATA_PEDIDO
FROM CLIENTE AS C
LEFT JOIN PEDIDO AS P
ON P.ID_CLIENTE = C.ID_CLIENTE
ORDER BY C.NOME;

-- 20. Liste apenas os clientes que nunca fizeram pedidos.
SELECT C.ID_CLIENTE, C.NOME AS CLIENTE
FROM CLIENTE AS C
LEFT JOIN PEDIDO AS P
ON P.ID_CLIENTE = C.ID_CLIENTE
WHERE P.ID_PEDIDO IS NULL;


-- PARTE E - DESAFIO GERENCIAL

-- 21. Informe quantos pedidos FINALIZADOS cada cliente realizou e quanto
--     cada cliente gastou. Ordene do maior gasto para o menor.
SELECT C.NOME AS CLIENTE,
COUNT(P.ID_PEDIDO) AS QTDE_PEDIDOS,
SUM(P.VALOR_TOTAL) AS TOTAL_GASTO
FROM CLIENTE AS C
INNER JOIN PEDIDO AS P
ON P.ID_CLIENTE = C.ID_CLIENTE
WHERE P.STATUS = 'FINALIZADO'
GROUP BY C.ID_CLIENTE, C.NOME
ORDER BY TOTAL_GASTO DESC;

-- 22. Mostre a quantidade de produtos e o preço médio de cada categoria.
SELECT CA.NOME AS CATEGORIA,
COUNT(PR.ID_PRODUTO) AS QTDE_PRODUTOS,
ROUND(AVG(PR.PRECO), 2) AS PRECO_MEDIO
FROM CATEGORIA AS CA
LEFT JOIN PRODUTO AS PR
ON PR.ID_CATEGORIA = CA.ID_CATEGORIA
GROUP BY CA.ID_CATEGORIA, CA.NOME
ORDER BY PRECO_MEDIO DESC;

-- 23. Descubra quais produtos possuem preço superior ao preço médio geral.
SELECT PR.NOME AS PRODUTO, PR.PRECO
FROM PRODUTO AS PR
WHERE PR.PRECO > (
    SELECT AVG(PRECO)
    FROM PRODUTO
)
ORDER BY PR.PRECO DESC;

-- 24. Classifique os produtos como Econômico, Intermediário ou Premium.
--     Defina e informe suas faixas de preço.
SELECT PR.NOME AS PRODUTO, PR.PRECO,
CASE
    WHEN PR.PRECO < 8.00 THEN 'ECONÔMICO'
    WHEN PR.PRECO <= 15.00 THEN 'INTERMEDIÁRIO'
    ELSE 'PREMIUM'
END AS CLASSIFICACAO
FROM PRODUTO AS PR
ORDER BY PR.PRECO;



-- 25. CONSULTA AUTORAL
-- Pergunta de negócio:
--
-- Por que essa informação é útil?

-- Consulta: Ajuda a comparar os preços dos produtos por categoria.


