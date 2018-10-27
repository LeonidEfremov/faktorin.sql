Тестовое задание  

Дано: таблица в БД (MSSQL), в которой хранятся поставки клиентов с суммами

id	ClientName	SupplyNumber	Date	Amount
1	ООО Ромашка	111	01.01.2017	100
2	ООО Ромашка	222	05.01.2017	150
3	ООО Ромашка	333	07.02.2017	200
4	ИП Лютик	444	02.01.2017	110
5	ИП Лютик	555	05.04.2017	120
6	ИП Лютик	666	07.04.2017	210
7	ООО Ромашка	777	10.03.2018	100
8	ИП Лютик	888	12.04.2018	210
 	…	…	…	…
n	ЗАО Тюльпан	xxx	06.06.2017	1000

Необходимо получить одним запросом  выборку за 2017 год в разрезе клиента по месяцам нарастающим итогом упорядоченную по клиенту, месяцу:

ClientName	Month	SumAmount
ООО Ромашка	1	250
ООО Ромашка	2	450
ИП Лютик	1	110
ИП Лютик	4	440
ЗАО Тюльпан	6	1000
