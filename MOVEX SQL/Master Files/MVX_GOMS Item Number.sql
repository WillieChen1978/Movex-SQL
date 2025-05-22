/*
=================
Author: QP118 Willie CHEN
Create Date: 2022年10月25日
Comments:
Movex Item Number Vs GOMS Item Number


Modified Log:

=================
*/

SELECT
	IFITNO AS Item#
	, IFISRS AS Status
	, IFSITE AS GOMSItemNumber
	, IFORCO AS CountryOfOrigin
FROM
	MVXBDTA888.MITVEN AS T01
WHERE
	IFSUNO = 'WHS300'