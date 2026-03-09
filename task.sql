1.-- "From the products table, I need a list of all products in the 'Electronics' 
-- category that cost more than $50.
-- Sort the results so the most expensive items appear at the top."


CREATE TABLE products (
product_id SERIAL PRIMARY KEY,
product_name VARCHAR(50) NOT NULL,
category VARCHAR(50) NOT NULL,
price FLOAT
);


INSERT INTO products(product_name,category,price)
VALUES
('Iphone 15','Electronics',999.99),
('Erogonomic Chair','Furniture',250.00),
('USB-C Cable','Electronics',19.99),
('Standing Desk','Furniture',450.00),
('Wireless Mouse','Electronics',49.99),
('Gaming Monitor','Electronics',300.00);

SELECT * FROM products;

-- QUERY

SELECT * FROM products
WHERE category = 'Electronics' AND price > 50.0
ORDER BY category DESC;


2.-- The Specifics: "From the customers table, 
-- find everyone who signed up in 2023, lives in 'New York' or 'California',
-- and has a name starting with the letter 'J'."



CREATE TABLE customers (
customer_id SERIAL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
city VARCHAR(50) NOT NULL,
signed_up  INT
);


INSERT INTO customers(first_name,last_name,city,signed_up)
VALUES
('Alice','Johnson','New York',2023),
('Bob','Smith','San Francisco',2022),
('Charlie','Brown','California',2023),
('David','Miller','New York',2023),
('Eva','Williams','Los Angeles',2022);

SELECT * FROM customers;


ALTER TABLE customers
DROP COLUMN signed_up;

SELECT * FROM customers;

ALTER TABLE customers
ADD signed_up INT;

-- QUERY

SELECT * FROM customers
WHERE signed_up = 2023 
AND city IN('New York','California')
AND first_name LIKE 'A%';



DROP TABLE products;


3.-- how me all products that are either 'Out of Stock' or have a status of 'Discontinued'. 
-- Only return the product_name and the stock_count."


CREATE TABLE products (
product_id SERIAL PRIMARY KEY,
product_name VARCHAR(50) NOT NULL,
category VARCHAR(50) NOT NULL,
price FLOAT,
status VARCHAR(50),
stock_count VARCHAR (50)
);

INSERT INTO products(product_name,category,price,status,stock_count)
VALUES
('Iphone 15','Electronics',999.99,'continued','In STock'),
('Erogonomic Chair','Furniture',250.00,'Discontinued','Out of Stock'),
('USB-C Cable','Electronics',19.99,'Continued','In Stock'),
('Standing Desk','Furniture',450.00,'Discontinued','Out Of Stock'),
('Wireless Mouse','Electronics',49.99,'Continued','In Stock'),
('Gaming Monitor','Electronics',300.00,'Discontinued','Out of Stock');


-- QUERY

SELECT product_name,stock_count FROM products
WHERE status = 'Discontinued' OR stock_count = 'Out of Stock';


4.-- "Find all customers who signed up after January 1st, 2023. 
-- Return their full name and signup date, ordered from the most recent signup to the oldest."



DROP TABLE customers;


CREATE TABLE customers (
customer_id SERIAL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
city VARCHAR(50) NOT NULL,
signed_up DATE 
);



INSERT INTO customers(first_name,last_name,city,signed_up)
VALUES
('Alice','Johnson','New York','2023-02-10'),
('Bob','Smith','San Francisco','2022-11-05'),
('Charlie','Brown','California','2023-05-15'),
('David','Miller','New York','2023-01-20'),
('Eva','Williams','Los Angeles','2022-12-25');


SELECT * FROM customers;


-- QUERY

SELECT 
CONCAT(first_name,' ',last_name) AS full_name,
signed_up
FROM customers
WHERE signed_up > '2023-01-01'
ORDER BY signed_up DESC;
