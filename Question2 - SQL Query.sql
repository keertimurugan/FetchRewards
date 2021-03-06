
--Question 2 - SQL Query

-- What are the top 5 brands by receipts scanned for most recent month?
-- NOTE: The most recent data in the dataset is from March 01, 2021 (5 months ago).

SELECT TOP 5 B.NAME AS BRAND_NAME, COUNT(B.ID) AS COUNT_BRAND
FROM BRANDS B
JOIN CPG C
ON B.ID = C.ID
JOIN ITEMLIST I
ON C.CPG_ID = I.REWARDSPRODUCTPARTNERID
JOIN RECEIPTS R
ON I.ID = R.ID
WHERE (CASE WHEN ISNUMERIC(R.DATESCANNED) = 1 THEN CAST(R.DATESCANNED AS FLOAT) ELSE NULL END) / 1000 >
DATEDIFF(SECOND, '1970-01-01T00:00:00', DATEADD(MONTH, -5, GETUTCDATE())
)
GROUP BY B.NAME
ORDER BY COUNT(B.ID) DESC

