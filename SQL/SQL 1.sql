Matheus

SELECT oc.Id, MAX(mc.Valor) 
FROM ORDERS_CAD as oc 
JOIN LEFT MASTER_CAD mc
ON oc.Id = mc.ClientId

Claudio 
-- campos a retornar
SELECT 
    m.nome, 
    m.email, 
    m.estado, 
    o.valorCompra, 
    o.dataCompra
FROM 
    MASTER_CAD m
-- join na tabela orders_cad usando chave email
JOIN 
    ORDERS_CAD o ON m.email = o.email
WHERE 
    -- subquery que pega compra de maior valor (max) de cada cliente
    (m.email, o.valorCompra) IN (
        SELECT 
            email, 
            MAX(valorCompra)
        FROM 
            ORDERS_CAD
        GROUP BY 
            email
    )
ORDER BY 
    m.nome;

-------------------------------------------------------------------

    -- campos a retornar
SELECT 
    m.nome, 
    m.email, 
    m.estado,
    -- subquery para pegar numero de vendas 
    (
        SELECT 
            COUNT(*)
        FROM 
            ORDERS_CAD o
        WHERE 
            o.email = m.email
    ) AS numeroVendas
FROM 
    MASTER_CAD m
ORDER BY 
    m.nome;


SELECT 
    a.userID,
    b.produto,
    a.data_compra,
    b.quantidade
FROM Master_Compras
LEFT JOIN Master_ItensVendas
WHERE 
b.produto is (algum de hipertenso) and
DATEDIFF(day, a.data_compra, GETDATE()) >= (b.quantidade_caixas * 30 - 5)

 
SELECT a.EmailAddress, a.SubscriberKey /* Selecionando os campos que vão ser mostrados */ 
FROM AllsubscribersComID a /* buscando os dados da tabela AllsubscribersComID */ 
INNER JOIN ent._Subscribers b on a.SubscriberKey = b.SubscriberKey /* juntando com a dataview de subscribers */ 
WHERE b.SubscriberKey LIKE '00%' /* condicionando a registros que a SubscriberKey começa com 00 */ 




SELECT TOP 100 SubscriberKey, jobId, EventDate
FROM _SENT
WHERE MONTH(EventDate) = 9


SELECT TOP 100 SubscriberKey, jobId, FORMAT(EventDate, 'MM') as Mes
FROM _SENT
WHERE FORMAT(EventDate, 'MM') = '09'









SELECT s.SubscriberKey,
COUNT(DAY(s.EventDate)) as EnviosDia,
DAY(s.EventDate) as Dia
FROM _SENT s
INNER JOIN _JOB j
ON s.jobId = j.jobId
WHERE MONTH(s.EventDate) = 9
GROUP BY s.SubscriberKey, DAY(s.EventDate)


SELECT s.SubscriberKey,
COUNT(DAY(s.EventDate)) as EnviosDia,
DAY(s.EventDate) as Dia
FROM _SENT s
WHERE MONTH(s.EventDate) = 9
GROUP BY s.SubscriberKey, DAY(s.EventDate)


SELECT SubscriberKey, COUNT(SubscriberKey) AS QUANTIDADE
FROM [Envios_dia_setembro]
GROUP BY SubscriberKey




SELECT TOP 40 Dia, 
SUM(EnviosDia) as EnviosTotaisDia,
CASE
    WHEN Dia = 1 THEN SUM(EnviosDia)
    WHEN Dia = 2 THEN SUM(EnviosDia)
    ELSE NULL
END AS QuantityText

FROM Envios_dia_Junho
GROUP BY Dia
ORDER BY Dia ASC


CASE
    WHEN Quantity > 30 THEN 'The quantity is greater than 30'
    WHEN Quantity = 30 THEN 'The quantity is 30'
    ELSE 'The quantity is under 30'
END AS QuantityText



SELECT Dia, COUNT(SubscriberKey) AS ATINGIDOS,
SUM(EnviosDia) as totalEnvios
FROM Envios_dia_Junho
GROUP BY Dia


Somar pessoas que receberam a comunicação por dia e 
dividir essa soma com o número de envios