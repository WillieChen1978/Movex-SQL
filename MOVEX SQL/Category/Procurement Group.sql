/*
=================
Author: QP118 Willie CHEN
Apr 12, 2022
Comments:
Procurement Group
Modified Log:

=================
*/
SELECT
	DISTINCT
CTSTKY AS ProcurementGroup
,
	TRIM( CAST (
        CTTX40 AS CHAR(40) CCSID 65535
    )) AS PRGP_Description
FROM
	MVXBDTA888.CSYTAB
WHERE
	CTCONO = 888
	AND CTSTCO = 'PRGP'