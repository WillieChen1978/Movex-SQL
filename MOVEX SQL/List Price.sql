/*
=================
Author: QP118 Willie CHEN
Apr 6, 2022
Comments:
List Price for Chinese Mainland

Modified Log:

=================
*/
/*List Price*/
    SELECT
    OMITNO AS Item
    , MDITDS AS Name_Chinese
    , OMCUCD AS Currency
    , OMSAPR List_Price
FROM
    MVXBDTA888.SIPRIL AS T01 /*MF: Price list, line (OM)*/
LEFT JOIN MVXBDTA888.MITLAD AS T02 ON
    OMITNO = MDITNO
WHERE
    OMCUCD = 'CNY'
    AND OMPRS1 = 'MA'
    AND MDLNCD = 'CS';

/*DB Cost*/
    SELECT
    OMITNO AS Item
    , MDITDS AS Name_Chinese
    , OMCUCD AS Currency
    , OMSAPR DB_COST
FROM
    MVXBDTA888.SIPRIL AS T01 /*MF: Price list, line (OM)*/
LEFT JOIN MVXBDTA888.MITLAD AS T02 ON
    OMITNO = MDITNO
WHERE
    OMCUCD = 'CNY'
    AND OMPRS1 = 'M1'
    AND MDLNCD = 'CS';

/*Combine Cost and Price*/
WITH DB_COST AS 
    (
    SELECT
        OMITNO AS Item
        , OMSAPR AS DB_COST
    FROM
        MVXBDTA888.SIPRIL
    WHERE
        OMCUCD = 'CNY'
        AND OMPRS1 = 'M1'
)
,
    List_Price AS 
    (
    SELECT
        OMITNO AS Item
        , OMSAPR AS List_Price
    FROM
        MVXBDTA888.SIPRIL
    WHERE
        OMCUCD = 'CNY'
        AND OMPRS1 = 'MA'
        ,
    List_Price_MG AS 
    (
            SELECT
                OMITNO AS Item
                , OMSAPR AS List_Price_MG
            FROM
                MVXBDTA888.SIPRIL
            WHERE
                OMCUCD = 'CNY'
                AND OMPRS1 = 'MA'
        )
)
        SELECT
            DISTINCT T01.OMITNO AS Item
    , T02.MDITDS AS Name_Chinese
    , T01.OMCUCD AS Currency
    , DB_COST
    , List_Price
    , List_Price_MG
    , T03.MMSTAT AS Status
    , T03.MMITGR Item_GRP
    , T03.MMITCL AS Product_GRP
FROM
            MVXBDTA888.SIPRIL AS T01
LEFT JOIN DB_COST ON
            DB_COST.Item = T01.OMITNO
LEFT JOIN List_Price ON
            List_Price.Item = T01.OMITNO
LEFT JOIN MVXBDTA888.MITLAD AS T02 ON
            T01.OMITNO = T02.MDITNO
LEFT JOIN MVXBDTA888.MITMAS AS T03 ON
            T01.OMITNO = T03.MMITNO
LEFT JOIN List_Price_MG AS T04 ON
            List_Price_MG.Item = t01.OMITNO
WHERE
            T01.OMCUCD = 'CNY'
    AND T02.MDLNCD = 'CS'
