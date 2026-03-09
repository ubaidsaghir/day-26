CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    salesperson VARCHAR(50),
    region VARCHAR(50),
    product VARCHAR(50),
    quantity INT,
    unit_price DECIMAL(10,2),
    sale_date DATE
);

INSERT INTO Sales VALUES
(1,'Ali','Karachi','Laptop',2,80000,'2023-01-05'),
(2,'Sara','Lahore','Smartphone',5,50000,'2023-01-10'),
(3,'Ahmed','Islamabad','Laptop',1,80000,'2023-01-12'),
(4,'Zain','Karachi','Desk',3,15000,'2023-02-01'),
(5,'Hina','Lahore','Laptop',1,80000,'2023-02-05'),
(6,'Bilal','Karachi','Smartphone',2,50000,'2023-02-10'),
(7,'Adeel','Islamabad','Chair',4,12000,'2023-03-01'),
(8,'Huzaifa','Lahore','Laptop',1,80000,'2023-03-05'),
(9,'Ali','Karachi','Chair',2,12000,'2023-03-10'),
(10,'Sara','Lahore','Desk',1,15000,'2023-03-12');



-- Task 1: Top salesperson by revenue
-- Calculate total revenue (quantity * unit_price) per salesperson
-- Show salesperson and total revenue
-- Sort descending and show top 3

SELECT 
    salesperson,
    SUM(quantity * unit_price) AS total_revenue
FROM Sales
GROUP BY salesperson
ORDER BY total_revenue DESC
LIMIT 3;


-- Task 2: Total quantity sold per region
-- Show region and total quantity sold
-- Sort by total quantity descending


SELECT region, SUM(quantity) AS total_quantity FROM Sales
GROUP BY region
ORDER BY total_quantity DESC;


-- Task 4: Monthly revenue report
-- Extract month from sale_date
-- Calculate total revenue per month
-- Sort ascending by month


SELECT TO_CHAR(sale_date, '%Y-%m') AS month,
SUM(quantity * unit_price) AS total_revenue
FROM Sales
GROUP BY month
ORDER BY month DESC;



-- Task 5: High-value sales
-- Show sales where quantity * unit_price > 100000
-- Include salesperson, region, product, total_sale_value
-- Sort descending by total_sale_value


SELECT salesperson,region,product,(quantity * unit_price) AS total_sale_value
FROM Sales
WHERE (quantity * unit_price) > 100000
ORDER BY total_sale_value DESC;


-- Task 6: Revenue per product per region
-- GROUP BY product, region
-- Show total revenue per combination
-- Sort descending

SELECT product,region,SUM(quantity * unit_price) AS total_revenue
FROM Sales
GROUP BY product, region
ORDER BY total_revenue DESC;


-- Task 7: Total quantity sold per salesperson
-- GROUP BY salesperson
-- Show salesperson and total quantity sold
-- Sort descending


SELECT salesperson, SUM(quantity) AS total_quantity
FROM Sales
GROUP BY salesperson
ORDER  BY total_quantity DESC; 


-- Task 8: Average quantity per month
-- GROUP BY month extracted from sale_date
-- Show month and average quantity sold
-- Sort ascending by month



SELECT sale_date,ROUND(AVG(quantity),2) AS total_average_quantity
FROM Sales
GROUP BY sale_date
ORDER BY sale_date;