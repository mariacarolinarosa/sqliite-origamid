--database: ./db.sqlite

CREATE TABLE produtos (
  id INTEGER PRIMARY KEY,
  nome TEXT NOT NULL,
  categoria TEXT,
  preco INTEGER NOT NULL,
  taxa_importacao INTEGER NOT NULL DEFAULT 0,
  estoque INTEGER NOT NULL DEFAULT 0,
  lancamento INTEGER DEFAULT 1 CHECK (lancamento IN (0, 1)),
  criado TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP --STRFTIME poderia ser utilizado aqui
) STRICT;

INSERT INTO produtos (nome,categoria,preco,taxa_importacao,estoque,lancamento,criado) VALUES
('Fone Bluetooth','audio',19900,0,150,0,'2048-01-16 10:12:34'),
('Teclado Mecânico','periferico',34900,6500,20,0,'2048-02-02 09:45:10'),
('Mouse Gamer Pro','periferico',24900,0,120,0,'2048-02-21 14:05:28'),
('Monitor 27 4K','monitor',219900,9000,40,0,'2048-03-06 11:23:57'),
('Hub USB-C','acessorio',9900,0,200,0,'2048-03-11 08:47:13'),
('Webcam 1080p','video',17900,3500,110,0,'2048-04-01 16:32:40'),
('SSD NVMe 1TB','armazenamento',57900,0,70,0,'2048-04-19 13:21:05'),
('Cadeira Ergonômica',null,139900,12000,0,0,'2048-05-03 09:14:22'),
('Notebook 14 1TB','notebook',429900,0,30,0,'2048-05-16 10:55:31'),
('Ring Light LED',null,8900,0,5,0,'2049-06-02 12:06:09'),
('Smartwatch',null,79900,8000,90,0,'2049-06-21 15:44:18'),
('Carregador GaN','energia',15900,0,140,0,'2049-07-06 11:12:47'),
('Notebook 16 2TB','notebook',529900,0,37,0,'2049-05-16 10:55:31'),
('Power Bank 20000 mAh','energia',22900,0,130,1,'2049-07-23 17:03:59'),
('Óculos 3D Pro','acessorio',21900,0,110,1,'2049-07-26 17:03:59'),
('Headset ANC Pro','audio',99900,11000,60,1,'2049-08-11 10:28:36'),
('Placa-mãe Z790','hardware',189900,0,35,1,'2049-09-02 09:49:52'),
('Processador X9-5600','hardware',159900,9500,50,0,'2049-09-19 14:17:08'),
('Processador X11-5600','hardware',199900,9500,50,0,'2049-10-01 14:17:08'),
('Impressora 3D Mini','impressora',249900,0,20,0,'2049-10-06 08:38:41'),
('Alto-falante WiFi Pro','audio',34900,0,100,0,'2049-11-02 16:25:55'),
('Câmera de Ação 4K','video',89900,7000,45,0,'2049-11-21 13:56:12'),
('Roteador WiFi 6E','rede',64900,0,75,0,'2049-12-06 11:11:11');

--LIKE
SELECT * FROM produtos WHERE nome LIKE 'impressora 3d mini'; --case insesitive

-- WILDCARD (%)
SELECT * FROM produtos WHERE nome LIKE '%3d%'; -- que tenha no meio
SELECT * FROM produtos WHERE nome LIKE '%pro%'; -- que tenha no meio
SELECT * FROM produtos WHERE nome NOT LIKE '%3d%'; -- que tenha no meio
SELECT * FROM produtos WHERE nome LIKE '%pro'; -- termine com
SELECT * FROM produtos WHERE nome LIKE 'pro%'; -- começe com

-- WILDCARD (_)
SELECT * FROM produtos WHERE nome LIKE '%_TB'; -- x caracteres antes de TB
SELECT * FROM produtos WHERE nome LIKE '% _TB'; -- x caracteres antes de TB

--BETWEEN
SELECT * FROM produtos WHERE preco BETWEEN 20000 AND 30000; -->= e <=
SELECT * FROM produtos WHERE criado BETWEEN '2049-06' AND '2049-08'; --Pode ser usado com datas
SELECT * FROM produtos WHERE criado NOT BETWEEN '2049-06' AND '2049-08'; --Pode ser usado com datas

--IN
SELECT * FROM produtos WHERE categoria IN ('notebook', 'hardware'); --pode ser usado o NOT antes
SELECT * FROM produtos WHERE nome LIKE '%notebook%' OR nome LIKE '%process%'; --alternativa: permite o uso do LIKE

--FUNÇÕES MATEMÁTICAS
SELECT COUNT(*) AS Total FROM produtos; -- se tiver NULL a linha não é contada
SELECT SUM(estoque) AS total_estoque FROM produtos;
SELECT SUM(preco * estoque) AS valor_total_produ FROM produtos; --permite operações dentro do parêntese do SUM
SELECT ROUND(AVG(preco)) AS media_preco FROM produtos;
SELECT MIN(preco) AS produto_mais_barato, nome FROM produtos;

--FUNÇÕES PARA STRINGS

SELECT LENGTH(nome) AS tamanho, nome FROM produtos;
SELECT LENGTH(nome) AS tamanho, nome FROM produtos WHERE tamanho > 10; --usar apelido permite reutilização
SELECT LOWER(nome) AS nome_min, nome FROM produtos;
SELECT LOWER(nome) AS nome_min, nome FROM produtos WHERE nome_min = 'fone bluetooth';
SELECT LOWER(nome) AS nome_min, nome FROM produtos WHERE nome_min = TRIM(LOWER('  fone bluetooth  ')); --TRIM remove espaços antes e depois da palavra
SELECT SUBSTR(nome, 1,5) FROM produtos; --Retorna o intervalo de letras de uma palavra

--DATAS (IMPORTANTE!)

SELECT DATE('now');
SELECT TIME ('now','-03:00'); --Remove as 3 horas de diferença
SELECT TIME ('now','-3 hour'); --Remove as 3 horas de diferença (jeito diferente de escrever)
SELECT TIME('now','localtime'); --Remove as 3 horas de diferença
SELECT DATETIME('now','localtime'); 
SELECT DATETIME('now','+7 days'); --dias, meses, anos
SELECT STRFTIME('%Y-%m-%d %H:%M:%S','now'); --!!!!

SELECT * FROM produtos WHERE criado BETWEEN DATE('2049-01-01') AND DATE('2049-01-01','+6 month');
SELECT STRFTIME('%Y/%m%d %H:%M:%S',criado) FROM produtos; --Formatando um valor