CREATE TABLE ExampleOne(
	id int IDENTITY(1,1) PRIMARY KEY,
	ClientName nvarchar(128) NOT NULL,
	SupplyNumber int NOT NULL,
	Date date NOT NULL,
	Amount decimal(10,2) NOT NULL
)
GO

INSERT ExampleOne VALUES 
	(N'ООО Ромашка', 111, '01.01.2017', 100), 
	(N'ООО Ромашка', 222, '01.05.2017', 150),
	(N'ООО Ромашка', 333, '02.07.2017', 200),
	(N'ИП Лютик', 444, '01.02.2017', 110),
	(N'ИП Лютик', 555, '04.05.2017', 120),
	(N'ИП Лютик', 666, '04.07.2017', 210),
	(N'ООО Ромашка', 777, '03.10.2018', 100),
	(N'ИП Лютик', 888, '04.12.2018', 210),
	(N'ЗАО Тюльпан', 999, '06.06.2017', 1000)

SELECT 
	e.ClientName,
	MONTH(e."Date") AS "Month",
	(
		SELECT SUM(eo.Amount)
		FROM ExampleOne eo
		WHERE 
			eo.ClientName = e.ClientName 
			AND YEAR(eo."Date") = YEAR(e."Date") 
			AND MONTH(eo."Date") <= MONTH(e."Date") 
	) AS "SumAmount"
FROM ExampleOne e
WHERE YEAR(e."Date") = 2017
GROUP BY e.ClientName, YEAR(e."Date"), MONTH(e."Date")
ORDER BY ClientName, MONTH(e."Date")


/*

ЗАО Тюльпан	6	1000.00
ИП Лютик	1	110.00
ИП Лютик	4	440.00
ООО Ромашка	1	250.00
ООО Ромашка	2	450.00

Сортировка отличается от результата в задании, но соответствует требованию "упорядоченную по клиенту, месяцу"

*/