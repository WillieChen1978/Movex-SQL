/*
=================
Author: QP118 Willie CHEN
Apr 12, 2022
Comments:
ITCL	Product Group


Modified Log:

=================
*/
SELECT
	DISTINCT
CTSTKY AS ProductGROUP
,
	TRIM( CAST (
        CTTX40 AS CHAR(40) CCSID 65535
    )) AS ITCL_Description
FROM
	MVXBDTA888.CSYTAB
WHERE
	CTCONO = 888
	AND CTSTCO = 'ITCL'