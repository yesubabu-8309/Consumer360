SHOW VARIABLES LIKE 'secure_file_priv';


LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/OnlineRetail_utf.csv"
INTO TABLE retail_sales
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    @InvoiceDate,
    UnitPrice,
    @CustomerID,
    Country
)
SET
    InvoiceDate = STR_TO_DATE(@InvoiceDate, '%m/%d/%Y %H:%i'),
    CustomerID = NULLIF(@CustomerID,'');

show warnings;
SELECT *
FROM retail_sales
LIMIT 157190, 10;

SELECT *
FROM retail_sales
LIMIT 279040, 10;

SELECT *
FROM retail_sales
LIMIT 359865, 10;

SELECT *
FROM retail_sales
LIMIT 361735, 10;

SELECT *
FROM retail_sales
WHERE UnitPrice <= 0;

SELECT
MIN(UnitPrice) AS MinPrice,
MAX(UnitPrice) AS MaxPrice
FROM retail_sales;

SELECT *
FROM retail_sales
WHERE UnitPrice IS NULL;

SELECT
    COUNT(*) AS TotalRows,
    COUNT(CustomerID) AS CustomerID_NotNull,
    SUM(CustomerID IS NULL) AS CustomerID_Null,
    SUM(Quantity <= 0) AS InvalidQuantity,
    SUM(UnitPrice <= 0) AS InvalidPrice,
    SUM(InvoiceNo LIKE 'C%') AS CancelledInvoices
FROM retail_sales;

ALTER TABLE retail_sales
MODIFY COLUMN UnitPrice DECIMAL(10,4);

TRUNCATE TABLE retail_sales;

SELECT COUNT(*) FROM retail_sales;

SELECT *
FROM retail_sales
LIMIT 10;