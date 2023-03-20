-- RESOLUÇÃO BUSINESS CASE

-- 1) Qual foi a quantidade total de vendas realizadas ?

SELECT COUNT(*)
FROM venda

-- Resposta: Foram realizadas um total de 3.000,00 vendas.


-- 2) Qual foi o valor total de vendas?

SELECT SUM(valor_unitario * quantidade) AS valor_total_vendas 
FROM venda

-- Resposta: O valor total de vendas fora de R$6.704.846,61.



-- 3) Qual foi o valor total do lucro?

SELECT SUM(a.valor_unitario * a.quantidade) - SUM(a.preco_custo * a.quantidade) as lucro
FROM venda a

--Resposta: O lucro total foi de R$2.762.533,81


-- 4) Qual foi a loja que mais obteve lucro?

SELECT b.nome_loja,
       SUM(a.valor_unitario * a.quantidade) - SUM(a.preco_custo * a.quantidade) as lucro
FROM venda a JOIN loja b ON  a.codigo_loja = b.codigo_loja
GROUP BY b.nome_loja
ORDER BY lucro DESC


-- Resposta: A loja que obteve maior lucro foi a Matriz. R$731.201,96



-- 5) Quem foi o vendedor com o melhor desempenho (maior valor de venda)?

SELECT v.nome_vendedor,
       SUM(a.valor_unitario * a.quantidade) as valor_total_venda 
FROM venda a JOIN vendedor v ON a.matricula_vendedor = v.matricula_vendedor
GROUP BY v.nome_vendedor
ORDER BY valor_total_venda DESC


-- Respota:  O vendedor com melhor desempenho foi José Maria com valor de vendas de R$654.050,81



-- 6) Crie um relatório com a quantidade  de  vendas  e  valor  total  de vendas por loja e por vendedor,
-- ordenado pelos respectivos campos.

SELECT l.nome_loja,
       v.nome_vendedor, 
       COUNT( a.codigo_venda) AS qtd_vendas, 
       SUM(a.valor_unitario * a.quantidade) AS valor_total_vendas
FROM venda a
       JOIN vendedor v ON a.matricula_vendedor = v.matricula_vendedor
	   JOIN loja l ON a.codigo_loja = l.codigo_loja
GROUP BY l.nome_loja,
         v.nome_vendedor
ORDER BY l.nome_loja,
         v.nome_vendedor