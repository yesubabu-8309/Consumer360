CREATE TABLE retail_sales (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(30),
    Description TEXT,
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10,2),
    CustomerID INT null,
    Country VARCHAR(100)
);
DESC retail_sales;