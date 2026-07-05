use consumer360;
SELECT
ROUND(SUM(SalesAmount),2) AS Total_Revenue
FROM retail_sales_clean;

SELECT
COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM retail_sales_clean;

SELECT
COUNT(DISTINCT CustomerID) AS Total_Customers
FROM retail_sales_clean;

SELECT
SUM(Quantity) AS Products_Sold
FROM retail_sales_clean;

SELECT
ROUND(
SUM(SalesAmount) /
COUNT(DISTINCT InvoiceNo),2
) AS Average_Order_Value
FROM retail_sales_clean;

SELECT
YEAR(InvoiceDate) AS Year,
MONTH(InvoiceDate) AS Month,
ROUND(SUM(SalesAmount),2) AS Revenue
FROM retail_sales_clean
GROUP BY
YEAR(InvoiceDate),
MONTH(InvoiceDate)
ORDER BY
Year,
Month;

SELECT
StockCode,
Description,
SUM(Quantity) AS TotalSold
FROM retail_sales_clean
GROUP BY
StockCode,
Description
ORDER BY TotalSold DESC
LIMIT 10;

SELECT
StockCode,
Description,
ROUND(SUM(SalesAmount),2) AS Revenue
FROM retail_sales_clean
GROUP BY
StockCode,
Description
ORDER BY Revenue DESC
LIMIT 10;

SELECT
Country,
ROUND(SUM(SalesAmount),2) AS Revenue
FROM retail_sales_clean
GROUP BY Country
ORDER BY Revenue DESC;

SELECT
CustomerID,
ROUND(SUM(SalesAmount),2) AS Revenue
FROM retail_sales_clean
GROUP BY CustomerID
ORDER BY Revenue DESC
LIMIT 20;

SELECT
YEAR(InvoiceDate) AS Year,
MONTH(InvoiceDate) AS Month,
COUNT(DISTINCT InvoiceNo) AS Orders
FROM retail_sales_clean
GROUP BY
YEAR(InvoiceDate),
MONTH(InvoiceDate)
ORDER BY
Year,
Month;

SELECT

ROUND(
SUM(Quantity)/
COUNT(DISTINCT InvoiceNo),2
) AS Average_Basket_Size
FROM retail_sales_clean;

SELECT

ROUND(
SUM(SalesAmount)/
COUNT(DISTINCT CustomerID),2
) AS Revenue_Per_Customer
FROM retail_sales_clean;

SELECT
DATE(InvoiceDate) AS Sales_Date,
ROUND(SUM(SalesAmount),2) AS Revenue
FROM retail_sales_clean
GROUP BY DATE(InvoiceDate)
ORDER BY Revenue DESC
LIMIT 10;

SELECT
StockCode,
Description,
COUNT(DISTINCT InvoiceNo) AS Orders,
SUM(Quantity) AS Quantity,
ROUND(SUM(SalesAmount),2) AS Revenue
FROM retail_sales_clean
GROUP BY
StockCode,
Description
ORDER BY Revenue DESC;
use consumer360;

