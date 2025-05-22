/*
=================
Author: QP118 Willie CHEN
Apr 6, 2022
Comments:
Language 
CS=Chinese
GB= English
Modified Log:

=================
*/

/*
 *  Chinese Name query
SELECT
    MDITNO AS Items#
--    , MDLNCD AS LANGUAGE
    , MDITDS AS Name_Chinese
FROM
    MVXBDTA888.MITLAD
WHERE  MDLNCD ='CS';
*/
/*
 * English Name query
SELECT
    MDITNO AS Items#
--    , MDLNCD AS LANGUAGE
    , MDITDS AS Name_English
FROM
    MVXBDTA888.MITLAD
WHERE  MDLNCD ='GB';
*/

/*Combine CS and GB*/


WITH Chinese AS (
    SELECT
        MDITNO AS Items#
        , MDITDS AS Name_Chinese
    FROM
        MVXBDTA888.MITLAD
    WHERE
        MDLNCD = 'CS'
)
,
English AS (
    SELECT
        MDITNO AS Items#
        , MDITDS AS Name_English
    FROM
        MVXBDTA888.MITLAD
    WHERE
        MDLNCD = 'GB'
)
SELECT
    DISTINCT MDITNO AS Items#
    ,
    Name_English
    ,
    Name_Chinese
FROM
    MVXBDTA888.MITLAD AS T01
LEFT JOIN Chinese ON
    T01.MDITNO = Chinese.Items#
LEFT JOIN English ON 
    T01.MDITNO = english.Items#


