SELECT
COUNT(*) AS TotalRows,
SUM(CustomerID IS NULL) AS MissingCustomerID,
SUM(Description IS NULL) AS MissingDescription
FROM retail_sales;

SELECT COUNT(*) AS MissingCustomerID
FROM retail_sales
WHERE CustomerID IS NULL;

SELECT
    COUNT(*) AS TotalRecords,
    SUM(CustomerID IS NULL) AS MissingCustomerID,
    SUM(Quantity <= 0) AS InvalidQuantity,
    SUM(UnitPrice <= 0) AS InvalidPrice,
    SUM(InvoiceNo LIKE 'C%') AS CancelledInvoices
FROM retail_sales;

SELECT COUNT(*) AS TotalRecords
FROM retail_sales;

SELECT COUNT(*) AS Cancelled_Orders
FROM retail_sales
WHERE InvoiceNo LIKE 'C%';

SELECT COUNT(*) AS Negative_Quantity
FROM retail_sales
WHERE Quantity<=0;

SELECT COUNT(*) AS Invalid_Price
FROM retail_sales
WHERE UnitPrice<=0;

SELECT
MIN(InvoiceDate) AS First_Order,
MAX(InvoiceDate) AS Last_Order
FROM retail_sales;

SELECT COUNT(DISTINCT CustomerID) AS Total_Customers
FROM retail_sales;

SELECT COUNT(DISTINCT Country) AS Total_Countries
FROM retail_sales;

SELECT COUNT(DISTINCT StockCode) AS Total_Products
FROM retail_sales;

SELECT
COUNT(*) AS Total_Records,
COUNT(DISTINCT CustomerID) AS Total_Customers,
COUNT(DISTINCT StockCode) AS Total_Products,
COUNT(DISTINCT Country) AS Countries,
SUM(CustomerID IS NULL) AS Missing_Customers,
SUM(InvoiceNo LIKE 'C%') AS Cancelled_Orders,
SUM(Quantity<=0) AS Negative_Quantity,
SUM(UnitPrice<=0) AS Invalid_Price
FROM retail_sales;


CREATE TABLE retail_sales_clean AS
SELECT *
FROM retail_sales
WHERE CustomerID IS NOT NULL
  AND Quantity > 0
  AND UnitPrice > 0
  AND InvoiceNo NOT LIKE 'C%';
  
SELECT COUNT(*) AS CleanRecords
FROM retail_sales_clean;

ALTER TABLE retail_sales_clean
ADD COLUMN SalesAmount DECIMAL(15,4);

SET SQL_SAFE_UPDATES = 0;

UPDATE retail_sales_clean 
SET SalesAmount = Quantity * UnitPrice;

SELECT
InvoiceNo,
Quantity,
UnitPrice,
SalesAmount
FROM retail_sales_clean
LIMIT 10;

SELECT
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    InvoiceDate,
    UnitPrice,
    CustomerID,
    Country,
    COUNT(*) AS DuplicateCount
FROM retail_sales
GROUP BY
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    InvoiceDate,
    UnitPrice,
    CustomerID,
    Country
HAVING COUNT(*) > 1;

SELECT COUNT(*) AS DuplicateGroups
FROM (
    SELECT
        InvoiceNo,
        StockCode,
        Description,
        Quantity,
        InvoiceDate,
        UnitPrice,
        CustomerID,
        Country,
        COUNT(*) AS cnt
    FROM retail_sales
    GROUP BY
        InvoiceNo,
        StockCode,
        Description,
        Quantity,
        InvoiceDate,
        UnitPrice,
        CustomerID,
        Country
    HAVING COUNT(*) > 1
) AS duplicates;


CREATE TABLE retail_sales_duplicate AS
SELECT *
FROM retail_sales
WHERE (
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    InvoiceDate,
    UnitPrice,
    CustomerID,
    Country
) IN (
    SELECT
        InvoiceNo,
        StockCode,
        Description,
        Quantity,
        InvoiceDate,
        UnitPrice,
        CustomerID,
        Country
    FROM retail_sales
    GROUP BY
        InvoiceNo,
        StockCode,
        Description,
        Quantity,
        InvoiceDate,
        UnitPrice,
        CustomerID,
        Country
    HAVING COUNT(*) > 1
);
