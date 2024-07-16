-- SQL Query Validation (PowerBI & Tableau)

USE Call_Center_Kansas;
GO

--1(A)th
SELECT
  YEAR([CREATION DATE]) AS Year,
  COUNT(*) AS TotalRequests
FROM
  dbo.stg_call_center_kansas
WHERE
  YEAR([CREATION DATE]) BETWEEN 2018 AND 2021
GROUP BY
  YEAR([CREATION DATE])
ORDER BY
  Year;


--1(B)th

SELECT
  YEAR([CREATION DATE]) AS Year,
  MONTH([CREATION DATE]) AS Month,
  COUNT(*) AS TotalRequests
FROM
  dbo.stg_call_center_kansas
GROUP BY
  YEAR([CREATION DATE]),
  MONTH([CREATION DATE])
ORDER BY
  Year,
  Month;



-- 2th
SELECT
  SOURCE,
  YEAR([CREATION DATE]) AS Year,
  MONTH([CREATION DATE]) AS Month,
  COUNT(*) AS TotalRequests
FROM
  dbo.stg_call_center_kansas
GROUP BY
  SOURCE,
  YEAR([CREATION DATE]),
  MONTH([CREATION DATE])
ORDER BY
  Year,
  Month; 


  -- 3th
  SELECT
  [WORK GROUP] AS Department,
  YEAR([CREATION DATE]) AS Year,
  MONTH([CREATION DATE]) AS Month,
  COUNT(*) AS TotalRequests
FROM
  dbo.stg_call_center_kansas
GROUP BY
  [WORK GROUP],
  YEAR([CREATION DATE]),
  MONTH([CREATION DATE])
ORDER BY
  Year,  Month;


--4th (gives non null values)
SELECT TOP 10
  CATEGORY1,
  DETAIL AS TypeOfRequest,
  [CREATION DATE],
  [CLOSED DATE],
  DATEDIFF(day, [CREATION DATE], [CLOSED DATE]) AS ResponseTime
FROM
  dbo.stg_call_center_kansas
WHERE
  [CREATION DATE] IS NOT NULL
  AND [CLOSED DATE] IS NOT NULL
ORDER BY
  ResponseTime ASC;


-- 5th
SELECT TOP 10
  [STREET ADDRESS],
  COUNT(*) AS TotalRequests
FROM
  dbo.stg_call_center_kansas
GROUP BY
  [STREET ADDRESS]
ORDER BY
  TotalRequests DESC;

-- 5 by zipcode
SELECT TOP 10
  [ZIP CODE],
  COUNT(*) AS TotalRequests
FROM
  dbo.stg_call_center_kansas
GROUP BY
  [ZIP CODE]
ORDER BY 
  TotalRequests DESC;


-- 6th
SELECT
  [WORK GROUP] AS Department,
  COUNT(*) AS TotalRequests
FROM
  dbo.stg_call_center_kansas
GROUP BY
  [WORK GROUP]
ORDER BY
  TotalRequests DESC; 

--7th

SELECT
  DEPARTMENT,
  COUNT(*) AS TotalRequests,
  AVG(CAST(CASE WHEN [CLOSED DATE] IS NOT NULL THEN DATEDIFF(day, [CREATION DATE], [CLOSED DATE]) END AS FLOAT)) AS AvgDaysToClose
FROM
  dbo.stg_call_center_kansas
GROUP BY
  DEPARTMENT
ORDER BY
  AvgDaysToClose;


-- 8th
SELECT
  STATUS,
  YEAR([CREATION DATE]) AS Year,
  COUNT(*) AS NumberOfRequests
FROM
  dbo.stg_call_center_kansas
WHERE
  YEAR([CREATION DATE]) BETWEEN 2018 AND 2021
GROUP BY
  STATUS,
  YEAR([CREATION DATE])
ORDER BY
  Year, STATUS;


-- 9th:
SELECT TOP 10 CATEGORY1, AVG([DAYS TO CLOSE]) AS AvgDaysToClose
FROM dbo.stg_call_center_kansas
GROUP BY CATEGORY1
ORDER BY AvgDaysToClose DESC;


-- 10th 
SELECT
  [WORK GROUP] AS Department,
  COUNT(*) AS TotalRequests,
  AVG(DATEDIFF(day, [CREATION DATE], [CLOSED DATE])) AS AverageDaysToClose
FROM
  dbo.stg_call_center_kansas
GROUP BY
  [WORK GROUP]
ORDER BY
  TotalRequests, AverageDaysToClose DESC;