/*
=================
Author: QP118 Willie CHEN
Apr 12, 2022
Comments:
contant list in following table

Contant	Description
PRGP	Procurement Group
ITTY	Item Type
CFC9	Market
ECAR	Area States
CUCL	Customer Group
CUCD	Currency ID
CFI1	Item Where Use
ITCL



Modified Log:

=================
*/
SELECT
	DISTINCT
CTSTKY AS ItemType
,
	TRIM( CAST (
        CTTX40 AS CHAR(40) CCSID 65535
    )) AS ITTY_Description
FROM
	MVXBDTA888.CSYTAB
WHERE
	CTCONO = 888
	AND CTSTCO = 'CCOM'