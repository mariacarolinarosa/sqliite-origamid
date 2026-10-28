--database: ./db.sqlite

--ORDER BY
SELECT * FROM produtos ORDER BY preco; --ordenado pela coluna preco | pode ser usado ASC/DESC para ordenar
SELECT * FROM produtos ORDER BY preco DESC LIMIT 5; --Pode ser usado para limitar a quantidade de itens
SELECT * FROM produtos ORDER BY categoria, preco DESC; --ordenação usando duas colunas
SELECT * FROM produtos ORDER BY criado DESC, categoria; --datas podem ser ordenadas

--GROUP BY
SELECT COUNT(*) AS total, categoria 
    FROM produtos GROUP BY categoria 
ORDER BY total;


SELECT AVG(preco) AS preco_medio, categoria 
    FROM produtos GROUP BY categoria 
ORDER BY preco_medio;

--ORDENAR POR ANO
