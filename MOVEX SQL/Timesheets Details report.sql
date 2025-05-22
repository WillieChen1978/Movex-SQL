/*
=================
Author: QP118 Willie CHEN
Apr 18, 2022
Comments:
Timesheets Details Report
Modified Log:

=================
*/

SELECT
    DISTINCT CURDATE() AS ReportDatevita
    ,
    SUBSTRING(T06.CDCYP1, 1, 4) AS Invoice_Year
    ,
    SUBSTRING(T06.CDCYP1, 5, 2) AS Invoice_Month
    ,
    T01.QJFACI AS Fac
    ,
    T08.QHORTY AS Order_type_ID
    ,
    T01.QJMWNO AS WO#
    ,
    T01.QJSUFI AS Service
    ,
    CAST(
        T04.CATX40 AS CHAR(40) CCSID 65535
    ) AS SERVICE_TXT
    ,
    T07.ZHZHER AS Rebuild_Location
    ,
    T07.ZHZLST AS Job_Unit
    ,
    T05.OZZCHG AS Charge_Code
    ,
    T04.CACFI1 AS SRT_Hrs
    ,
    T01.QJUMAT AS Used_lab_run_time
    ,
    T01.QJMWNO AS WO_no
    ,
    T01.QJPRNO AS Product_no
    ,
    T08.QHBANO AS ESN
    ,
    T01.QJPLGR AS Work_center
    ,
    T03.EADEPT AS Dept
    ,
    T03.EAREAR AS Plan_Area
    ,
    T01.QJEMNO AS Empl_no
    ,
    T03.EAEMNM AS Name
    ,
    T01.QJTRDT AS Trans_date
    ,
    T01.QJSTDT AS Start_date
    ,
    T01.QJOSTM AS Start_time
    ,
    T01.QJFIDT AS Finish_date
    ,
    T01.QJOFTM AS Stop_time
    ,
    T01.QJRORN AS MCO#
    ,
    T01.QJRORL AS MCO_ln#
    ,
    T01.QJRGDT AS Entry_date
    ,
    T09.ZXCDTP AS Charge_Code_Type
    ,
    T09.ZXJBTP AS Job_Type
    ,
    T02.ZJOVTM AS Overtime
    ,
    T01.QJCHID AS Change_ID
FROM
    MVXBDTA888.MMOPTR AS T01
    ,
    MVXBDTA888.ZMOPTR AS T02
    ,
    MVXBDTA888.CEAEMP AS T03
    ,
    MVXBDTA888.MPDSCF AS T04
    ,
    MVXBDTA888.ZCUORL AS T05
    ,
    MVXBDTA888.CSYCAL AS T06
    ,
    MVXBDTA888.ZCUORH AS T07
    ,
    MVXBDTA888.MMOHED AS T08
    ,
    MVXBDTA888.ZCURT1 AS T09
WHERE
    T01.QJCONO = T02.ZJCONO
    AND T01.QJFACI = T02.ZJFACI
    AND T01.QJMWNO = T02.ZJMWNO
    AND T01.QJOPNO = T02.ZJOPNO
    AND T01.QJPRNO = T02.ZJPRNO
    AND T01.QJEMNO = T02.ZJEMNO
    AND T01.QJTRDT = T02.ZJTRDT
    AND T01.QJTRTM = T02.ZJTRTM
    AND T01.QJTMSX = T02.ZJTMSX
    AND T01.QJOPTP = T02.ZJOPTP
    AND T01.QJFICD = T02.ZJFICD
    AND T01.QJRGDT = T02.ZJRGDT
    AND T01.QJRGTM = T02.ZJRGTM
    AND T01.QJFACI = t03.EAFACI
    AND T01.QJEMNO = T03.EAEMNO
    AND T04.CACONO = T01.QJCONO
    AND T04.CASUFI = T01.QJSUFI
    AND T01.QJCONO = T05.OZCONO
    AND T01.QJFACI = T05.OZFACI
    AND T01.QJRORN = T05.OZORNO
    AND T01.QJRORL = t05.OZPONR
    AND T01.QJTRDT = T06.CDUDF8
    AND T01.QJFACI = T06.CDDIVI
    AND T01.QJCONO = T05.OZCONO
    AND T05.OZCONO = T07.ZHCONO
    AND T05.OZORNO = T07.ZHORNO
    AND T01.QJCONO = t08.QHCONO
    AND T01.QJFACI = t08.QHFACI
    AND T01.QJMWNO = t08.QHMWNO
    AND T05.OZCONO = T09.ZXCONO
    AND T05.OZFACI = T09.ZXFACI
    AND T05.OZZCHG = T09.ZXZCHG
    AND T01.QJCONO = 888
    AND t01.QJUMAT <> 0
    AND RIGHT (
        TRIM(T01.QJPLGR)
        ,
    3
    ) IN (
        'LAB' ,
    'TRV'
    )
    AND T01.QJEMNO <> ''