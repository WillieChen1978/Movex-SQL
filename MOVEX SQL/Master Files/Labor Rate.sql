/*
=================
Author: QP118 Willie CHEN
Apr 18, 2022
Comments:
Labor Rate
Modified Log:

=================
*/

SELECT
	T01.KEFACI AS Facitly
	,
	T02.CFFACN AS FAC_Name
	,
	T01.KEFRDT AS Effective_date
	,
	T01.KECDPR AS Rate
	,
	T01.KEPLGR AS Workcenter
	,
	T01.KECCOM AS Costing_component
	,
	T01.*
FROM
	MVXBDTA888.MCWCCO AS T01
LEFT JOIN MVXBDTA888.CFACIL AS T02 ON
	T01.KEFACI = T02.CFFACI
WHERE
	KEPCTP = 1
	AND T01.KEFRDT >20000000
	AND KEPLGR LIKE '%LAB%'
--	AND KEFACI='275'
	AND 
	NOT KEFACI IN (
		'100', '210', '230', '311', '420', '700','281'
	)
	
ORDER BY
	KEFRDT DESC