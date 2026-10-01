create database sales_order_analytics;
use sales_order_analytics;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    city VARCHAR(80),
    signup_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE,
    status VARCHAR(30),
    total_amount DECIMAL(12,2),

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT,
    unit_price DECIMAL(10,2),

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    payment_date DATE,
    amount DECIMAL(12,2),
    payment_status VARCHAR(30),

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);

show tables;

INSERT INTO customers
(customer_id, name, email, city, signup_date)
VALUES
(1, 'Arun Kumar', 'arun@gmail.com', 'Chennai', '2025-01-10'),
(2, 'Priya Sharma', 'priya@gmail.com', 'Pondicherry', '2025-01-15'),
(3, 'Rahul Raj', 'rahul@gmail.com', 'Bangalore', '2025-01-20'),
(4, 'Divya Krishnan', 'divya@gmail.com', 'Coimbatore', '2025-02-05'),
(5, 'Karthik S', 'karthik@gmail.com', 'Chennai', '2025-02-10'),
(6, 'Anjali Devi', 'anjali@gmail.com', 'Madurai', '2025-02-15'),
(7, 'Vijay Kumar', 'vijay@gmail.com', 'Trichy', '2025-02-20'),
(8, 'Sneha R', 'sneha@gmail.com', 'Salem', '2025-03-01'),
(9, 'Suresh Babu', 'suresh@gmail.com', 'Chennai', '2025-03-05'),
(10, 'Meena Lakshmi', 'meena@gmail.com', 'Pondicherry', '2025-03-10'),
(11, 'Harish M', 'harish@gmail.com', 'Bangalore', '2025-03-15'),
(12, 'Keerthana P', 'keerthana@gmail.com', 'Chennai', '2025-03-20'),
(13, 'Ramesh Kumar', 'ramesh@gmail.com', 'Madurai', '2025-04-01'),
(14, 'Nithya S', 'nithya@gmail.com', 'Coimbatore', '2025-04-05'),
(15, 'Gokul Raj', 'gokul@gmail.com', 'Trichy', '2025-04-10'),
(16, 'Aishwarya V', 'aishwarya@gmail.com', 'Chennai', '2025-04-15'),
(17, 'Manoj K', 'manoj@gmail.com', 'Salem', '2025-05-01'),
(18, 'Pavithra R', 'pavithra@gmail.com', 'Pondicherry', '2025-05-05'),
(19, 'Dinesh B', 'dinesh@gmail.com', 'Bangalore', '2025-05-10'),
(20, 'Swetha M', 'swetha@gmail.com', 'Chennai', '2025-05-15');

select*from customers;

INSERT INTO products
(product_id, product_name, category, price, stock)
VALUES
(101, 'Laptop', 'Electronics', 55000.00, 20),
(102, 'Wireless Mouse', 'Accessories', 800.00, 100),
(103, 'Keyboard', 'Accessories', 1500.00, 75),
(104, 'Monitor', 'Electronics', 12000.00, 30),
(105, 'Headphones', 'Accessories', 2500.00, 60),
(106, 'Smartphone', 'Electronics', 30000.00, 25),
(107, 'Tablet', 'Electronics', 22000.00, 35),
(108, 'Smart Watch', 'Wearables', 5000.00, 40),
(109, 'USB Cable', 'Accessories', 500.00, 150),
(110, 'Power Bank', 'Accessories', 1800.00, 80),
(111, 'Bluetooth Speaker', 'Electronics', 3500.00, 45),
(112, 'Office Chair', 'Furniture', 7500.00, 25),
(113, 'Study Table', 'Furniture', 6000.00, 20),
(114, 'Backpack', 'Bags', 2200.00, 50),
(115, 'Notebook', 'Stationery', 250.00, 200),
(116, 'Pen Set', 'Stationery', 150.00, 300),
(117, 'Printer', 'Electronics', 15000.00, 15),
(118, 'Webcam', 'Electronics', 4500.00, 35),
(119, 'External Hard Disk', 'Storage', 6500.00, 30),
(120, 'SSD 1TB', 'Storage', 7500.00, 25);

select*from products;

INSERT INTO orders
(order_id, customer_id, order_date, status, total_amount)
VALUES
(1001, 1, '2025-01-20', 'COMPLETED', 55800.00),
(1002, 2, '2025-01-25', 'COMPLETED', 1500.00),
(1003, 3, '2025-02-02', 'COMPLETED', 30000.00),
(1004, 4, '2025-02-10', 'COMPLETED', 12500.00),
(1005, 5, '2025-02-15', 'COMPLETED', 2500.00),
(1006, 1, '2025-02-20', 'COMPLETED', 22000.00),
(1007, 6, '2025-03-01', 'COMPLETED', 5000.00),
(1008, 7, '2025-03-05', 'COMPLETED', 7500.00),
(1009, 8, '2025-03-10', 'COMPLETED', 3500.00),
(1010, 9, '2025-03-15', 'COMPLETED', 15000.00),

(1011, 10, '2025-03-20', 'COMPLETED', 6500.00),
(1012, 2, '2025-03-25', 'COMPLETED', 5000.00),
(1013, 11, '2025-04-01', 'COMPLETED', 4500.00),
(1014, 12, '2025-04-05', 'COMPLETED', 7500.00),
(1015, 13, '2025-04-10', 'COMPLETED', 2200.00),
(1016, 5, '2025-04-15', 'COMPLETED', 30000.00),
(1017, 14, '2025-04-20', 'COMPLETED', 6000.00),
(1018, 15, '2025-04-25', 'COMPLETED', 3500.00),
(1019, 16, '2025-05-01', 'COMPLETED', 55000.00),
(1020, 17, '2025-05-05', 'COMPLETED', 22000.00),

(1021, 18, '2025-05-10', 'COMPLETED', 1800.00),
(1022, 19, '2025-05-15', 'COMPLETED', 7500.00),
(1023, 20, '2025-05-20', 'COMPLETED', 15000.00),
(1024, 1, '2025-05-25', 'COMPLETED', 6500.00),
(1025, 3, '2025-06-01', 'COMPLETED', 12000.00),
(1026, 4, '2025-06-05', 'COMPLETED', 2500.00),
(1027, 6, '2025-06-10', 'COMPLETED', 30000.00),
(1028, 8, '2025-06-15', 'COMPLETED', 7500.00),
(1029, 10, '2025-06-20', 'COMPLETED', 3500.00),
(1030, 12, '2025-06-25', 'COMPLETED', 15000.00),

(1031, 2, '2025-07-01', 'COMPLETED', 22000.00),
(1032, 5, '2025-07-05', 'COMPLETED', 55000.00),
(1033, 7, '2025-07-10', 'COMPLETED', 1800.00),
(1034, 9, '2025-07-15', 'COMPLETED', 5000.00),
(1035, 11, '2025-07-20', 'COMPLETED', 4500.00),
(1036, 13, '2025-07-25', 'COMPLETED', 6500.00),
(1037, 15, '2025-08-01', 'COMPLETED', 7500.00),
(1038, 17, '2025-08-05', 'COMPLETED', 30000.00),
(1039, 19, '2025-08-10', 'COMPLETED', 12000.00),
(1040, 20, '2025-08-15', 'COMPLETED', 2200.00),

(1041, 1, '2025-08-20', 'PENDING', 4500.00),
(1042, 4, '2025-08-25', 'CANCELLED', 6000.00),
(1043, 6, '2025-09-01', 'COMPLETED', 15000.00),
(1044, 8, '2025-09-05', 'COMPLETED', 5000.00),
(1045, 12, '2025-09-10', 'COMPLETED', 7500.00),
(1046, 14, '2025-09-15', 'COMPLETED', 2500.00),
(1047, 16, '2025-09-20', 'COMPLETED', 30000.00),
(1048, 18, '2025-09-25', 'COMPLETED', 1800.00),
(1049, 3, '2025-10-01', 'COMPLETED', 6500.00),
(1050, 10, '2025-10-05', 'COMPLETED', 15000.00);

select*from orders;

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(1,1001,101,1,55000),
(2,1001,102,1,800),

(3,1002,103,1,1500),

(4,1003,106,1,30000),

(5,1004,104,1,12000),
(6,1004,102,1,500),

(7,1005,105,1,2500),

(8,1006,107,1,22000),

(9,1007,108,1,5000),

(10,1008,112,1,7500),

(11,1009,111,1,3500),

(12,1010,117,1,15000),

(13,1011,119,1,6500),

(14,1012,108,1,5000),

(15,1013,118,1,4500),

(16,1014,120,1,7500),

(17,1015,114,1,2200),

(18,1016,106,1,30000),

(19,1017,113,1,6000),

(20,1018,111,1,3500),

(21,1019,101,1,55000),

(22,1020,107,1,22000),

(23,1021,110,1,1800),

(24,1022,120,1,7500),

(25,1023,117,1,15000),

(26,1024,119,1,1),
(27,1024,119,1,6500),

(28,1025,104,1,12000),

(29,1026,105,1,2500),

(30,1027,106,1,30000),

(31,1028,112,1,7500),

(32,1029,111,1,3500),

(33,1030,117,1,15000),

(34,1031,107,1,22000),

(35,1032,101,1,55000),

(36,1033,110,1,1800),

(37,1034,108,1,5000),

(38,1035,118,1,4500),

(39,1036,119,1,6500),

(40,1037,112,1,7500),

(41,1038,106,1,30000),

(42,1039,104,1,12000),

(43,1040,114,1,2200),

(44,1041,118,1,4500),

(45,1042,113,1,6000),

(46,1043,117,1,15000),

(47,1044,108,1,5000),

(48,1045,120,1,7500),

(49,1046,105,1,2500),

(50,1047,106,1,30000),

(51,1048,110,1,1800),

(52,1049,119,1,6500),

(53,1050,117,1,15000);

UPDATE order_items
SET unit_price = 6500
WHERE order_item_id = 26;

INSERT INTO payments
(payment_id, order_id, payment_date, amount, payment_status)
VALUES
(501,1001,'2025-01-20',55800,'PAID'),
(502,1002,'2025-01-25',1500,'PAID'),
(503,1003,'2025-02-02',30000,'PAID'),
(504,1004,'2025-02-10',12500,'PAID'),
(505,1005,'2025-02-15',2500,'PAID'),
(506,1006,'2025-02-20',22000,'PAID'),
(507,1007,'2025-03-01',5000,'PAID'),
(508,1008,'2025-03-05',7500,'PAID'),
(509,1009,'2025-03-10',3500,'PAID'),
(510,1010,'2025-03-15',15000,'PAID'),
(511,1011,'2025-03-20',6500,'PAID'),
(512,1012,'2025-03-25',5000,'PAID'),
(513,1013,'2025-04-01',4500,'PAID'),
(514,1014,'2025-04-05',7500,'PAID'),
(515,1015,'2025-04-10',2200,'PAID'),
(516,1016,'2025-04-15',30000,'PAID'),
(517,1017,'2025-04-20',6000,'PAID'),
(518,1018,'2025-04-25',3500,'PAID'),
(519,1019,'2025-05-01',55000,'PAID'),
(520,1020,'2025-05-05',22000,'PAID'),
(521,1021,'2025-05-10',1800,'PAID'),
(522,1022,'2025-05-15',7500,'PAID'),
(523,1023,'2025-05-20',15000,'PAID'),
(524,1024,'2025-05-25',6500,'PAID'),
(525,1025,'2025-06-01',12000,'PAID'),
(526,1026,'2025-06-05',2500,'PAID'),
(527,1027,'2025-06-10',30000,'PAID'),
(528,1028,'2025-06-15',7500,'PAID'),
(529,1029,'2025-06-20',3500,'PAID'),
(530,1030,'2025-06-25',15000,'PAID'),
(531,1031,'2025-07-01',22000,'PAID'),
(532,1032,'2025-07-05',55000,'PAID'),
(533,1033,'2025-07-10',1800,'PAID'),
(534,1034,'2025-07-15',5000,'PAID'),
(535,1035,'2025-07-20',4500,'PAID'),
(536,1036,'2025-07-25',6500,'PAID'),
(537,1037,'2025-08-01',7500,'PAID'),
(538,1038,'2025-08-05',30000,'PAID'),
(539,1039,'2025-08-10',12000,'PAID'),
(540,1040,'2025-08-15',2200,'PAID'),
(541,1041,'2025-08-20',4500,'PENDING'),
(542,1042,'2025-08-25',6000,'REFUNDED'),
(543,1043,'2025-09-01',15000,'PAID'),
(544,1044,'2025-09-05',5000,'PAID'),
(545,1045,'2025-09-10',7500,'PAID'),
(546,1046,'2025-09-15',2500,'PAID'),
(547,1047,'2025-09-20',30000,'PAID'),
(548,1048,'2025-09-25',1800,'PAID'),
(549,1049,'2025-10-01',6500,'PAID'),
(550,1050,'2025-10-05',15000,'PAID');

select count(*) as customers from customers;
select count(*) as products from products;
select count(*) as orders from orders;
select count(*) as order_items from order_items;
select count(*) as payments from payments;

SELECT * 
FROM customers;
SELECT name, city
FROM customers;
SELECT *
FROM customers
WHERE city = 'Chennai';
SELECT *
FROM products
WHERE price > 10000;
SELECT *
FROM orders
WHERE status = 'COMPLETED';

INSERT INTO customers
(customer_id, name, email, city, signup_date)
VALUES
(21, 'Sanjay Kumar', 'sanjay@gmail.com', 'Chennai', '2025-06-01');

SELECT *
FROM customers
WHERE customer_id = 21;
UPDATE customers
SET city = 'Bangalore'
WHERE customer_id = 21;
SELECT *
FROM customers
WHERE customer_id = 21;

DELETE FROM customers
WHERE customer_id = 21;
SELECT *
FROM customers
WHERE customer_id = 21;
SELECT COUNT(*) AS total_customers
FROM customers;
SELECT COUNT(*) AS total_products
FROM products;
SELECT COUNT(*) AS total_orders
FROM orders;

SELECT 
    SUM(total_amount) AS total_revenue
FROM orders
WHERE status = 'COMPLETED';

SELECT
    AVG(total_amount) AS average_order_value
FROM orders
WHERE status = 'COMPLETED';

SELECT
    MIN(price) AS cheapest_product
FROM products;

SELECT
    MAX(price) AS most_expensive_product
FROM products;

SELECT
    city,
    COUNT(*) AS customer_count
FROM customers
GROUP BY city;

SELECT
    status,
    SUM(total_amount) AS revenue
FROM orders
GROUP BY status;

SELECT
    customer_id,
    COUNT(*) AS number_of_orders
FROM orders
GROUP BY customer_id
ORDER BY number_of_orders DESC;

SELECT
    customer_id,
    COUNT(*) AS order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 2;

SELECT
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent,
    AVG(o.total_amount) AS average_order_value
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status = 'COMPLETED'
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC;

-- joins

SELECT
    c.customer_id,
    c.name,
    o.order_id,
    o.order_date,
    o.status,
    o.total_amount
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id;
    
SELECT
    c.name AS customer_name,
    c.city,
    o.order_id,
    o.order_date,
    o.total_amount
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status = 'COMPLETED'
ORDER BY o.order_date;

SELECT
    c.customer_id,
    c.name,
    o.order_id,
    o.total_amount
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id;

SELECT
    c.customer_id,
    c.name,
    c.city
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

SELECT
    o.order_id,
    o.order_date,
    o.total_amount,
    p.payment_date,
    p.amount,
    p.payment_status
FROM orders o
INNER JOIN payments p
    ON o.order_id = p.order_id;
    
SELECT
    c.name AS customer_name,
    o.order_id,
    o.order_date,
    o.total_amount,
    p.amount AS payment_amount,
    p.payment_status
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN payments p
    ON o.order_id = p.order_id;
    
SELECT
    p.product_id,
    p.product_name,
    oi.order_id,
    oi.quantity,
    oi.unit_price
FROM products p
INNER JOIN order_items oi
    ON p.product_id = oi.product_id;

SELECT
    p.product_name,
    p.category,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM products p
INNER JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.product_name,
    p.category
ORDER BY revenue DESC;

SELECT
    p.product_id,
    p.product_name,
    p.category,
    p.stock
FROM products p
LEFT JOIN order_items oi
    ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;

SELECT
    c.name AS customer_name,
    c.city,
    o.order_id,
    o.order_date,
    p.product_name,
    p.category,
    oi.quantity,
    oi.unit_price,
    (oi.quantity * oi.unit_price) AS item_total,
    pay.payment_status
FROM customers c

INNER JOIN orders o
    ON c.customer_id = o.customer_id

INNER JOIN order_items oi
    ON o.order_id = oi.order_id

INNER JOIN products p
    ON oi.product_id = p.product_id

INNER JOIN payments pay
    ON o.order_id = pay.order_id

ORDER BY o.order_date;

SELECT
    p.category,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM products p
INNER JOIN order_items oi
    ON p.product_id = oi.product_id
INNER JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.status = 'COMPLETED'
GROUP BY p.category
ORDER BY total_revenue DESC;

SELECT
    c.city,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_revenue
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status = 'COMPLETED'
GROUP BY c.city
ORDER BY total_revenue DESC;

SELECT
    c.customer_id,
    c.name,
    c.city,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent,
    AVG(o.total_amount) AS average_order_value
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status = 'COMPLETED'
GROUP BY
    c.customer_id,
    c.name,
    c.city
ORDER BY total_spent DESC;

-- overall sales summary

SELECT
    COUNT(*) AS total_orders,
    SUM(total_amount) AS total_revenue,
    AVG(total_amount) AS average_order_value,
    MIN(total_amount) AS minimum_order_value,
    MAX(total_amount) AS maximum_order_value
FROM orders
WHERE status = 'COMPLETED';

SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(total_amount) AS monthly_revenue
FROM orders
WHERE status = 'COMPLETED'
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    year,
    month;
    
SELECT
    p.product_id,
    p.product_name,
    p.category,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.status = 'COMPLETED'
GROUP BY
    p.product_id,
    p.product_name,
    p.category
ORDER BY revenue DESC
LIMIT 10;

SELECT
    c.customer_id,
    c.name,
    c.city,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status = 'COMPLETED'
GROUP BY
    c.customer_id,
    c.name,
    c.city
ORDER BY total_spent DESC
LIMIT 10;

SELECT
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status = 'COMPLETED'
GROUP BY
    c.customer_id,
    c.name
HAVING COUNT(o.order_id) > 1
ORDER BY order_count DESC;

SELECT
    p.category,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.status = 'COMPLETED'
GROUP BY p.category
ORDER BY total_revenue DESC;

SELECT
    c.city,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status = 'COMPLETED'
GROUP BY c.city
ORDER BY total_revenue DESC;

SELECT
    status,
    COUNT(*) AS order_count,
    SUM(total_amount) AS total_amount
FROM orders
GROUP BY status;

SELECT
    payment_status,
    COUNT(*) AS payment_count,
    SUM(amount) AS total_payment
FROM payments
GROUP BY payment_status;

SELECT
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders,
    AVG(o.total_amount) AS average_order_value
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status = 'COMPLETED'
GROUP BY
    c.customer_id,
    c.name
ORDER BY average_order_value DESC;

SELECT
    product_id,
    product_name,
    category,
    stock
FROM products
WHERE stock < 30
ORDER BY stock;

SELECT
    p.product_id,
    p.product_name,
    p.stock,
    COALESCE(SUM(oi.quantity), 0) AS units_sold
FROM products p
LEFT JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.product_name,
    p.stock
ORDER BY units_sold ASC;

SELECT
    status,
    SUM(total_amount) AS total_amount
FROM orders
WHERE status IN ('COMPLETED', 'CANCELLED')
GROUP BY status;

SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    year,
    month;

SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    COUNT(*) AS total_orders,
    SUM(total_amount) AS total_revenue,
    AVG(total_amount) AS average_order_value
FROM orders
WHERE status = 'COMPLETED'
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    year,
    month;
    
    SELECT
    product_name,
    category,
    price
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
)
ORDER BY price DESC;
SELECT AVG(price)
FROM products;

SELECT
    c.customer_id,
    c.name,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status = 'COMPLETED'
GROUP BY c.customer_id, c.name
HAVING SUM(o.total_amount) > (
    SELECT AVG(customer_total)
    FROM (
        SELECT
            customer_id,
            SUM(total_amount) AS customer_total
        FROM orders
        WHERE status = 'COMPLETED'
        GROUP BY customer_id
    ) AS customer_sales
)
ORDER BY total_spent DESC;

WITH customer_sales AS (
    SELECT
        customer_id,
        SUM(total_amount) AS total_sales
    FROM orders
    WHERE status = 'COMPLETED'
    GROUP BY customer_id
)
SELECT *
FROM customer_sales
ORDER BY total_sales DESC;

WITH customer_sales AS (
    SELECT
        c.customer_id,
        c.name,
        SUM(o.total_amount) AS total_sales
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    WHERE o.status = 'COMPLETED'
    GROUP BY c.customer_id, c.name
)
SELECT *
FROM customer_sales
ORDER BY total_sales DESC
LIMIT 5;

SELECT
    c.customer_id,
    c.name,
    SUM(o.total_amount) AS total_spent,

    CASE
        WHEN SUM(o.total_amount) >= 50000
            THEN 'Premium Customer'

        WHEN SUM(o.total_amount) >= 20000
            THEN 'Regular Customer'

        ELSE 'Low Value Customer'
    END AS customer_segment

FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id

WHERE o.status = 'COMPLETED'

GROUP BY
    c.customer_id,
    c.name

ORDER BY total_spent DESC;

SELECT
    order_id,
    total_amount,

    CASE
        WHEN total_amount >= 30000
            THEN 'High Value'

        WHEN total_amount >= 10000
            THEN 'Medium Value'

        ELSE 'Low Value'
    END AS order_category

FROM orders
WHERE status = 'COMPLETED';

SELECT
    c.customer_id,
    c.name,
    SUM(o.total_amount) AS total_revenue,

    RANK() OVER (
        ORDER BY SUM(o.total_amount) DESC
    ) AS revenue_rank

FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id

WHERE o.status = 'COMPLETED'

GROUP BY
    c.customer_id,
    c.name;
    
SELECT
    c.customer_id,
    c.name,
    SUM(o.total_amount) AS total_revenue,

    DENSE_RANK() OVER (
        ORDER BY SUM(o.total_amount) DESC
    ) AS revenue_rank

FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id

WHERE o.status = 'COMPLETED'

GROUP BY
    c.customer_id,
    c.name;
    
WITH monthly_sales AS (
    SELECT
        YEAR(order_date) AS year,
        MONTH(order_date) AS month,
        SUM(total_amount) AS monthly_revenue
    FROM orders
    WHERE status = 'COMPLETED'
    GROUP BY
        YEAR(order_date),
        MONTH(order_date)
)

SELECT
    year,
    month,
    monthly_revenue,

    SUM(monthly_revenue) OVER (
        ORDER BY year, month
    ) AS running_total

FROM monthly_sales
ORDER BY year, month;

WITH monthly_sales AS (
    SELECT
        YEAR(order_date) AS year,
        MONTH(order_date) AS month,
        SUM(total_amount) AS revenue
    FROM orders
    WHERE status = 'COMPLETED'
    GROUP BY
        YEAR(order_date),
        MONTH(order_date)
)

SELECT
    year,
    month,
    revenue,

    LAG(revenue) OVER (
        ORDER BY year, month
    ) AS previous_month_revenue

FROM monthly_sales
ORDER BY year, month;

WITH monthly_sales AS (
    SELECT
        YEAR(order_date) AS year,
        MONTH(order_date) AS month,
        SUM(total_amount) AS revenue
    FROM orders
    WHERE status = 'COMPLETED'
    GROUP BY
        YEAR(order_date),
        MONTH(order_date)
),

monthly_comparison AS (
    SELECT
        year,
        month,
        revenue,

        LAG(revenue) OVER (
            ORDER BY year, month
        ) AS previous_revenue

    FROM monthly_sales
)

SELECT
    year,
    month,
    revenue,
    previous_revenue,

    revenue - previous_revenue AS revenue_change

FROM monthly_comparison
ORDER BY year, month;

WITH monthly_sales AS (
    SELECT
        YEAR(order_date) AS year,
        MONTH(order_date) AS month,
        SUM(total_amount) AS revenue
    FROM orders
    WHERE status = 'COMPLETED'
    GROUP BY
        YEAR(order_date),
        MONTH(order_date)
),

monthly_comparison AS (
    SELECT
        year,
        month,
        revenue,

        LAG(revenue) OVER (
            ORDER BY year, month
        ) AS previous_revenue

    FROM monthly_sales
)

SELECT
    year,
    month,
    revenue,
    previous_revenue,

    ROUND(
        ((revenue - previous_revenue)
        / NULLIF(previous_revenue, 0)) * 100,
        2
    ) AS growth_percentage

FROM monthly_comparison
ORDER BY year, month;

WITH product_sales AS (
    SELECT
        p.product_id,
        p.product_name,
        SUM(oi.quantity * oi.unit_price) AS revenue
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    JOIN orders o
        ON oi.order_id = o.order_id
    WHERE o.status = 'COMPLETED'
    GROUP BY
        p.product_id,
        p.product_name
),

ranked_products AS (
    SELECT
        product_id,
        product_name,
        revenue,

        ROW_NUMBER() OVER (
            ORDER BY revenue DESC
        ) AS product_rank

    FROM product_sales
)

SELECT *
FROM ranked_products
WHERE product_rank <= 3;

CREATE VIEW customer_sales_view AS
SELECT
    c.customer_id,
    c.name,
    c.city,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent,
    AVG(o.total_amount) AS average_order_value
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status = 'COMPLETED'
GROUP BY
    c.customer_id,
    c.name,
    c.city;
    
SELECT *
FROM customer_sales_view;

SELECT *
FROM customer_sales_view;


 SELECT *
FROM monthly_sales_view
ORDER BY year, month;   

SELECT *
FROM product_sales_view
ORDER BY revenue DESC;

SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';


SHOW INDEX FROM orders;
SHOW INDEX FROM order_items;
EXPLAIN
SELECT *
FROM orders
WHERE customer_id = 5;

EXPLAIN
SELECT *
FROM orders
WHERE order_date >= '2025-06-01';

SELECT
    COUNT(*) AS total_orders,
    SUM(total_amount) AS total_revenue,
    AVG(total_amount) AS average_order_value,
    MIN(total_amount) AS minimum_order_value,
    MAX(total_amount) AS maximum_order_value
FROM orders
WHERE status = 'COMPLETED';

SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    COUNT(*) AS total_orders,
    SUM(total_amount) AS revenue,
    AVG(total_amount) AS average_order_value
FROM orders
WHERE status = 'COMPLETED'
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    year,
    month;
    
SELECT
    p.product_name,
    p.category,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.status = 'COMPLETED'
GROUP BY
    p.product_id,
    p.product_name,
    p.category
ORDER BY revenue DESC
LIMIT 10;

SELECT
    c.customer_id,
    c.name,
    c.city,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent,
    AVG(o.total_amount) AS average_order_value
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status = 'COMPLETED'
GROUP BY
    c.customer_id,
    c.name,
    c.city
ORDER BY total_spent DESC;

SELECT
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS completed_orders,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status = 'COMPLETED'
GROUP BY
    c.customer_id,
    c.name
HAVING COUNT(o.order_id) > 1
ORDER BY completed_orders DESC;

SELECT
    p.category,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.status = 'COMPLETED'
GROUP BY p.category
ORDER BY revenue DESC;

SELECT
    c.city,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS revenue,
    AVG(o.total_amount) AS average_order_value
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status = 'COMPLETED'
GROUP BY c.city
ORDER BY revenue DESC;

SELECT
    status,
    COUNT(*) AS order_count,
    SUM(total_amount) AS total_amount
FROM orders
GROUP BY status
ORDER BY order_count DESC;

SELECT
    payment_status,
    COUNT(*) AS payment_count,
    SUM(amount) AS total_amount
FROM payments
GROUP BY payment_status;

SELECT
    product_id,
    product_name,
    category,
    stock,
    price,
    stock * price AS inventory_value
FROM products
ORDER BY inventory_value DESC;

SELECT
    product_id,
    product_name,
    category,
    stock
FROM products
WHERE stock < 30
ORDER BY stock ASC;
