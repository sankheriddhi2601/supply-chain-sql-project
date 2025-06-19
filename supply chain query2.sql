
INSERT INTO Products VALUES
(1, 'Soccer Ball', 'Gear', 10.00, 20.00),
(2, 'Tennis Racket', 'Gear', 25.00, 50.00),
(3, 'Running Shoes', 'Footwear', 40.00, 80.00),
(4, 'Yoga Mat', 'Fitness', 8.00, 16.00),
(5, 'Boxing Gloves', 'Gear', 15.00, 30.00);

INSERT INTO Inventory VALUES
(1, 100, 30, 40),
(2, 15, 20, 25),
(3, 5, 10, 15),
(4, 45, 10, 20),
(5, 60, 15, 30);

INSERT INTO Suppliers VALUES
(1, 'ProGear Distributors', 'contact@progear.com'),
(2, 'Athletica Supply Co.', 'sales@athletica.com');

INSERT INTO Restocks VALUES
(1, 1, 1, '2025-05-01', 100, 4),
(2, 2, 1, '2025-05-03', 50, 7),
(3, 3, 2, '2025-05-05', 60, 9),
(4, 4, 2, '2025-05-10', 40, 3),
(5, 5, 1, '2025-05-12', 50, 6);

INSERT INTO Orders VALUES
(101, '2025-06-01', 1, 200.00),
(102, '2025-06-02', 2, 150.00),
(103, '2025-06-03', 1, 300.00),
(104, '2025-06-04', 3, 400.00),
(105, '2025-06-05', 2, 220.00);

INSERT INTO Order_Details VALUES
(1, 101, 1, 5, 20.00),
(2, 102, 2, 3, 50.00),
(3, 103, 3, 2, 80.00),
(4, 104, 4, 4, 16.00),
(5, 105, 5, 3, 30.00);

SELECT * FROM Products;
SELECT * FROM Inventory;
SELECT * FROM Suppliers;
SELECT * FROM Restocks;
SELECT * FROM Orders;
SELECT * FROM Order_Details;

