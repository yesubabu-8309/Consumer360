USE CONSUMER360;

CREATE VIEW view_country_sales AS
SELECT
Country,
ROUND(SUM(SalesAmount),2) AS Revenue
FROM retail_sales_clean
GROUP BY Country;

CREATE VIEW view_monthly_sales AS
SELECT
YEAR(InvoiceDate) AS Year,
MONTH(InvoiceDate) AS Month,
ROUND(SUM(SalesAmount),2) AS Revenue
FROM retail_sales_clean
GROUP BY
YEAR(InvoiceDate),
MONTH(InvoiceDate);

CREATE VIEW view_top_customers AS
SELECT
CustomerID,
ROUND(SUM(SalesAmount),2) AS Revenue
FROM retail_sales_clean
GROUP BY CustomerID;