/*
=================
Author: QP118 Willie CHEN
Apr 19, 2022
Comments:
Customer Group
Modified Log:

=================
*/
SELECT
	DISTINCT
CTSTKY AS CustomerGroup
,
	TRIM( CAST (
        CTTX40 AS CHAR(40) CCSID 65535
    )) AS CUCL_Description
FROM
	MVXBDTA888.CSYTAB
WHERE
	CTCONO = 888
	AND CTSTCO = 'CUCL'