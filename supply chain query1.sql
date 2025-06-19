CREATE DATABASE SupplyChainDB;
Go

USE SupplyChainDB;
Go

--Products Table

CREATE TABLE Products (
	product_id INT PRIMARY KEY,
	name VARCHAR(100),
	category VARCHAR(50),
	cost_price DECIMAL(10,2),
	selling_price DECIMAL(10,2)
	);

	-- Inventory Table
CREATE TABLE Inventory (
    product_id INT PRIMARY KEY FOREIGN KEY REFERENCES Products(product_id),
    stock_quantity INT,
    safety_stock INT,
    restock_threshold INT
);

-- Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    total_value DECIMAL(10,2)
);

-- Order Details Table
CREATE TABLE Order_Details (
    order_detail_id INT PRIMARY KEY,
    order_id INT FOREIGN KEY REFERENCES Orders(order_id),
    product_id INT FOREIGN KEY REFERENCES Products(product_id),
    quantity INT,
    unit_price DECIMAL(10,2)
);

-- Suppliers Table
CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    name VARCHAR(100),
    contact_info VARCHAR(100)
);

-- Restocks Table
CREATE TABLE Restocks (
    restock_id INT PRIMARY KEY,
    product_id INT FOREIGN KEY REFERENCES Products(product_id),
    supplier_id INT FOREIGN KEY REFERENCES Suppliers(supplier_id),
    restock_date DATE,
    quantity INT,
    delivery_time_days INT
);

SELECT 
    p.name AS product_name,
    i.stock_quantity,
    i.restock_threshold,
    (i.restock_threshold - i.stock_quantity) AS units_to_order
FROM Inventory i
JOIN Products p ON i.product_id = p.product_id
WHERE i.stock_quantity < i.restock_threshold;

SELECT 
    p.name AS product_name,
    i.stock_quantity,
    i.safety_stock,
    (i.stock_quantity - i.safety_stock) AS excess_stock
FROM Inventory i
JOIN Products p ON i.product_id = p.product_id
WHERE i.stock_quantity > i.safety_stock * 2;

SELECT 
    p.name AS product_name,
    SUM(od.quantity) AS total_units_sold
FROM Order_Details od
JOIN Products p ON od.product_id = p.product_id
GROUP BY p.name
ORDER BY total_units_sold DESC;

SELECT 
    p.name AS product_name,
    SUM(od.quantity * od.unit_price) AS total_revenue
FROM Order_Details od
JOIN Products p ON od.product_id = p.product_id
GROUP BY p.name
ORDER BY total_revenue DESC;

SELECT 
    s.name AS supplier_name,
    COUNT(*) AS deliveries_made,
    AVG(r.delivery_time_days) AS avg_delivery_days
FROM Restocks r
JOIN Suppliers s ON r.supplier_id = s.supplier_id
GROUP BY s.name
ORDER BY avg_delivery_days ASC;

SELECT 
    p.name AS product_name,
    COUNT(r.restock_id) AS restock_count,
    SUM(r.quantity) AS total_restocked
FROM Restocks r
JOIN Products p ON r.product_id = p.product_id
GROUP BY p.name
ORDER BY total_restocked DESC;

SELECT 
    FORMAT(order_date, 'yyyy-MM') AS month,
    SUM(total_value) AS monthly_sales
FROM Orders
GROUP BY FORMAT(order_date, 'yyyy-MM')
ORDER BY month;


