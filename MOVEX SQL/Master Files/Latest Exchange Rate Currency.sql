/*
=================
Author: QP118 Willie CHEN
Jun 22, 2022
Comments:
Exchange Rate
exchange Rate with 
Yearly CUCRTP=1
Monthly CUCRTP=
Modified Log:

Rate factor
1-1000:1
2-100:1
3-10:1
4-1:1
5-1:10
6-1:100
7-1:1000

Rate type

01 Corporate Exchange Rate    
10 Standard Cost Exchange Rate
30 Parts Selling Exchange Rate
40 

=================
*/

SELECT
	DISTINCT CUCUTD AS Rate_Date
	,
	CULOCD AS Currency
	,
	CUARAT AS Rate
	, 1/CUARAT AS OneUSDto
FROM
	MVXBDTA888.CCURRA AS T01
WHERE
	CUCUCD = 'USD'
	AND CUCRTP = 1
	AND T01.CUCUTD = (
	SELECT
		MAX(CUCUTD)
	FROM
		MVXBDTA888.CCURRA AS t001
	WHERE
		CUCUTD = t001.CUCUTD )