CREATE DATABASE IF NOT EXISTS laundrydb;
USE laundrydb;

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS dress;

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    customer_lastname VARCHAR(50),
    customer_phone VARCHAR(20)
);

CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    employee_lastname VARCHAR(50),
    employee_phone VARCHAR(20)
);

CREATE TABLE dress (
    dress_id INT PRIMARY KEY,
    dress_color VARCHAR(20),
    dress_type VARCHAR(30),
    service VARCHAR(30)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date VARCHAR(10),
    delivery_date VARCHAR(10),
    customer_id INT,
    employee_id INT,
    dress_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
    FOREIGN KEY (dress_id) REFERENCES dress(dress_id)
);

-- =========================
-- CUSTOMER DATA
-- =========================
INSERT INTO customer VALUES
(36, 'احمدخانی', '09125608032'),
(52, 'افشاری', '09354921188'),
(13, 'محمدی', '09911757994'),
(44, 'حسینی', '09121234567'),
(55, 'کریمی', '09331234567'),
(67, 'رضایی', '09159874562'),
(81, 'عباسی', '09981234567'),
(90, 'جعفری', '09122334455');

-- =========================
-- ONLY ONE EMPLOYEE (BAIRAMI)
-- =========================
INSERT INTO employee VALUES
(110, 'بایرامی', '09371593559');

-- =========================
-- DRESS DATA
-- =========================
INSERT INTO dress VALUES
(62, 'آبی', 'پیراهن', 'اتو'),
(23, 'مشکی', 'کت', 'شستشو'),
(17, 'سرمه‌ای', 'شلوار', 'لکه‌بری'),
(28, 'سفید', 'مانتو', 'اتو'),
(29, 'قرمز', 'پیراهن', 'شستشو'),
(30, 'سبز', 'کت', 'اتو'),
(31, 'مشکی', 'شلوار', 'خشکشویی'),
(32, 'آبی روشن', 'تی‌شرت', 'شستشو');

-- =========================
-- ORDERS DATA (ALL FOR SAME EMPLOYEE)
-- =========================
INSERT INTO orders VALUES
(36523, '1405/01/30', '1405/02/07', 36, 110, 62),
(36524, '1405/02/11', '1405/02/18', 52, 110, 23),
(36525, '1405/02/12', '1405/02/19', 13, 110, 17),
(36526, '1405/02/13', '1405/02/20', 44, 110, 28),
(36527, '1405/02/14', '1405/02/21', 55, 110, 29),
(36528, '1405/02/15', '1405/02/22', 67, 110, 30),
(36529, '1405/02/16', '1405/02/23', 81, 110, 31),
(36530, '1405/02/17', '1405/02/24', 90, 110, 32),
(36531, '1405/02/18', '1405/02/25', 36, 110, 29),
(36532, '1405/02/19', '1405/02/26', 52, 110, 62),
(36533, '1405/02/20', '1405/02/27', 13, 110, 23),
(36534, '1405/02/21', '1405/02/28', 44, 110, 17),
(36535, '1405/02/22', '1405/03/01', 55, 110, 28),
(36536, '1405/02/23', '1405/03/02', 67, 110, 30);

-- =========================
-- QUERIES
-- =========================

SELECT * FROM customer;
SELECT * FROM employee;
SELECT * FROM dress;
SELECT * FROM orders;

SELECT COUNT(*) AS total_orders FROM orders;

SELECT c.customer_lastname, o.order_id
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id;

SELECT 
    c.customer_lastname,
    e.employee_lastname,
    d.dress_type,
    d.service
FROM orders o
JOIN customer c ON o.customer_id = c.customer_id
JOIN employee e ON o.employee_id = e.employee_id
JOIN dress d ON o.dress_id = d.dress_id;