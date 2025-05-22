/*
=================
Author: QP118 Willie CHEN
Apr 12, 2022
Comments:
Item Group
Modified Log:

=================
*/
SELECT
	DISTINCT
CTSTKY AS ITEMGROUP
,
	TRIM( CAST (
        CTTX40 AS CHAR(40) CCSID 65535
    )) AS ITGR_Description
FROM
	MVXBDTA888.CSYTAB
WHERE
	CTCONO = 888
	AND CTSTCO = 'ITGR'