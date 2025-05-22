/*
=================
Author: QP118 Willie CHEN
Apr 8, 2022
Comments:
Service Sales Revenue And Cost Report
Tables:
ACUORL TF: Order Line                                (OL)
ZCUORL TF: Order line - extension                    (OZ)
ACUORH TF: Order Head                                (OH)
OCUSMA MF: Customer                                  (OK)
ACUIVH TF: Order invoice heads                       (IH)
OCUSMA MF: Customer                                  (OK)
ZCURAT MF: Rates table                               (RZ)
ACUOLS MF: Order line summary                        (OS)
CSYCAL MF: System calender                           (CD)
CFACIL MF: Facilities                                (CF)
Modified Log:

=================
*/
SELECT
	CURDATE() AS RUNDATE
	, T01.OLFACI AS Facility
	, T10.CFFACN AS Facility_Name
	, T01.OLORNO AS CO#
	, T01.OLPONR AS Line#
	, T02.OZZCHG AS Charge_code
	, SUBSTR(
		T01.OLPRNO
		, 3
		, 13
	) AS ENG_MODEL
	, T01.OLBANO AS ESN
	, T03.OHCUNO AS Customer#
	, T04.OKCUNM AS Customer_name
	, T04.OKCUCD AS Currency
	, T05.IHPYNO AS Payer
	, T06.OKCUNM AS Payer_name
	, T03.OHAAGN AS Agreement_number
	, T03.OHOREF AS JOB#
	, T08.OSASTM AS Revenue_time
	, T08.OSASMT AS Revenue_material
	, T08.OSASSC AS Revenues_subcontracting
	, T08.OSASSH AS Revenue_subcontracting_handling_charge
	, T08.OSASMI AS Revenue_miscellaneous
	, T08.OSASTM + T08.OSASMT + T08.OSASSC + T08.OSASSH + T08.OSASMI AS TOTAL_SALE
	, T08.OSACTU AS Cost_time
	, T08.OSACM1 AS Cost_material
	, T08.OSACSC AS Cost_subcontracting
	, T08.OSACTU + T08.OSACM1 + T08.OSACSC AS TOTAL_COST
	, T09.CDCYP1 AS Period
	, T04.OKOREF AS Market
	, T11.ZHZLST AS SubMarket
	, T03.OHORDT AS Ord_Date
	, T05.IHIVDT AS Invoice_Date
	, T07.RZIVRT AS Invoice_reg_TYPE
	,
	CASE
		WHEN T11.ZHZHER = 1 THEN 'Workshop'
		WHEN T11.ZHZHER = 2 THEN 'Mobile'
		ELSE ''
	END AS Repair_Location /* make Location readable*/
FROM
	MVXBDTA888.ACUORL AS T01
LEFT JOIN MVXBDTA888.ZCUORL AS T02 ON
	T01.OLORNO = T02.OZORNO
	AND T01.OLPONR = T02.OZPONR
LEFT JOIN MVXBDTA888.ACUORH AS T03 ON
	T01.OLORNO = T03.OHORNO
LEFT JOIN MVXBDTA888.OCUSMA AS T04 ON
	T03.OHCUNO = T04.OKCUNO
LEFT JOIN MVXBDTA888.ACUIVH AS T05 ON
	T01.OLFACI = T05.IHFACI
	AND T01.OLIVNO = T05.IHIVNO
LEFT JOIN MVXBDTA888.OCUSMA AS T06 ON
	T05.IHPYNO = T06.OKCUNO
LEFT JOIN MVXBDTA888.ZCURAT AS T07 ON
	T01.OLFACI = T07.RZFACI
	AND T02.OZZCHG = T07.RZZCHG
LEFT JOIN MVXBDTA888.ACUOLS AS T08 ON
	T01.OLORNO = T08.OSORNO
	AND T01.OLPONR = T08.OSPONR
LEFT JOIN MVXBDTA888.CSYCAL AS T09 ON
	T03.OHDIVI = T09.CDDIVI
	AND T01.OLIVDT = T09.CDYMD8
LEFT JOIN MVXBDTA888.CFACIL AS T10 ON
	T01.OLFACI = T10.CFFACI
LEFT JOIN MVXBDTA888.ZCUORH AS T11 ON
	T01.OLORNO = T11.ZHORNO
WHERE
	T01.OLCONO = 888
	AND T01.OLAOST = '70'
--	AND T04.OKOREF <> 'HMLD'
	AND T11.ZHZHER <> ''
	AND T01.OLIVDT BETWEEN 20110101 AND 20231231
	AND T07.RZIVRT = 1
	AND T08.OSAQUO = 0
	AND T01.OLORNO =''