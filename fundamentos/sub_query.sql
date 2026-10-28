--database: ./db.sqlite

--SUBQUERY
SELECT * FROM aulas WHERE id = (SELECT id FROM cursos WHERE slug = 'javascript-basico'); 

--WITH AS: cria uma tabela temporária

WITH preco_medio AS(
    SELECT AVG(preco) AS media FROM produtos
)
SELECT * FROM produtos wHERE preco > (SELECT media FROM preco_medio);