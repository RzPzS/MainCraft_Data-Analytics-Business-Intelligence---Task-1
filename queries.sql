CREATE TABLE sales_data (
    Order_ID VARCHAR(50),
    Order_Date DATE,
    Customer_Name VARCHAR(100),
    City VARCHAR(100),
    State VARCHAR(100),
    Region VARCHAR(50),
    Country VARCHAR(50),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(200),
    Quantity INT,
    Unit_Price DECIMAL(10,2),
    Revenue DECIMAL(12,2),
    Profit DECIMAL(12,2)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/product_sales_dataset_final.csv'
INTO TABLE sales_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT Region, SUM(Revenue) AS Total_Sales
FROM sales_data
GROUP BY Region
ORDER BY Total_Sales DESC;

SELECT Product_Name, SUM(Profit) AS Total_Profit
FROM sales_data
GROUP BY Product_Name
ORDER BY Total_Profit DESC
LIMIT 5;

SELECT 
    YEAR(Order_Date) AS Year,
    MONTH(Order_Date) AS Month,
    SUM(Revenue) AS Total_Sales
FROM sales_data
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY Year, Month;


