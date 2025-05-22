/*
=================
Author: QP118 Willie CHEN
Apr 19, 2022
Comments:
Customer Master
Modified Log:

=================
*/

WITH CustomerGP AS (
	SELECT
		DISTINCT
CTSTKY AS CustomerGroup
		, TRIM( CAST (
        CTTX40 AS CHAR(40) CCSID 65535
    )) AS CUCL_Description
	FROM
		MVXBDTA888.CSYTAB
	WHERE
		CTCONO = 888
		AND CTSTCO = 'CUCL'
)
SELECT
	OKSTAT AS Status
	, OKCUNO AS CustomerNumber
	, OKCUCL AS Customer_Group
	, CUCL_Description AS CUGRP_description
	, OKCUTP AS Customer_Type
	, OKALCU AS SEARCH_key
	, OKCUNM AS Customer_name
	, OKOREF AS Market
	, OKTEPY AS PaymentTerms
	, OKSMCD AS SalesPerson
	, OKRESP AS Responsible
	, OKDISY AS DiscountModel
	, OKDIGC AS DiscountGroup
	, OKCUCD AS Currency
	, OKORTP AS CustomerOrderType
	, OKWHLO AS Warehouse
	, OKSDST AS Disctrct
	, OKCSCD AS Country
	, OKCFC9 AS Market
	, OKPRS1 AS PriceList
	, OKECAR AS Area_State
FROM
	MVXBDTA888.OCUSMA AS T01
LEFT JOIN CustomerGP ON
	CustomerGP.CustomerGroup = T01.OKCUCL
WHERE
	OKCONO = '888'
	AND OKSTAT <= '20'
	--    AND OKOREF <> 'HMLD'
	--    AND OKCUNO = '2850012'