/*
=================
Author: QP118 Willie CHEN
Apr 6, 2022
Comments:
Template for Functions and SQL Syntax
Modified Log:

=================
*/
/*日期转换为DB2 日期格式*/
SELECT YEAR (CURDATE()) *10000+ MONTH (CURDATE())*100 +DAY (CURDATE()),T01.* FROM MVXBDTA888.SPRICH AS T01;
/*中文乱码切换*/
SELECT
    DISTINCT
    CTSTCO AS CONSTANT
    , CTSTKY AS KEY
    , TRIM( CAST (
        CTTX40 AS CHAR(40) CCSID 65535
    )) AS Description/* CCSID 65535 需要配合Bin translation 参数生效*/
FROM
    MVXBDTA888.CSYTAB
WHERE
    CTCONO = 888