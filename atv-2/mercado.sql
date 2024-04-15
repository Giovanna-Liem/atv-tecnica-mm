/*Elabore uma consulta que retorne os códigos de barras dos produtos cadastrados pela primeira vez no
banco nos últimos 10 dias.*/

SELECT CODIGO_DE_BARRAS FROM PRODUTO WHERE DATA_CADASTRO BETWEEN '2024-04-04' AND '2024-04-13';


/*Elabore uma consulta que retorne os nomes das origens que tiveram algum produto cadastrado ou
atualizado no mês de março de 2020*/

SELECT NOME FROM ORIGEM WHERE MONTH(DATA_CADASTRO) = 3 AND MONTH(DATA_ATT) = 3;

/* Houve um erro na atualização da origem “DISTRIBUIDORA TESTE” em que todos os produtos do
fabricante “JOAO” foram enviados com nome “MARIA”. Faça um update que troque os produtos da
“DISTRIBUIDORA TESTE” com fabricante “MARIA” para o fabricante “JOAO” */

/* Neste caso foi utilizado um ID fictício ao invés do nome "Maria" para evitar que sejam alterados dados erroneamente */

UPDATE FABRICANTE SET NOME = "JOAO" WHERE ID = 1;

/*Elabore uma consulta que retorne os códigos de barras, descrição, nome do fabricante e código interno
de todos os produtos cadastrados de acordo com a ordem de preferência, onde um código de barras
aparecerá apenas uma vez no resultado com as informações da origem de maior preferência disponível
para ele*/

SELECT 
    P.CODIGO_DE_BARRAS,
    PI.DESCRICAO,
    PI.CODIGO_INTERNO,
    F.NOME AS NOME_FABRICANTE,
    O.PREFERENCIA
FROM 
    PRODUTO_INFO PI
INNER JOIN 
    PRODUTO P ON PI.ID_PRODUTO = P.ID
LEFT JOIN 
    FABRICANTE F ON PI.ID_FABRICANTE = F.ID
LEFT JOIN 
    ORIGEM O ON PI.ID_ORIGEM = O.ID

ORDER BY O.PREFERENCIA; 