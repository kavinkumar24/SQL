CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Address VARCHAR(255),
    Phone VARCHAR(15)
);
----
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    CustomerID INT,
    OrderName VARCHAR(100),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
----
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    PaymentDate DATE,
    AmountPaid DECIMAL(10, 2),
    OrderID INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
----
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Address, Phone)
VALUES
(1, 'Ram', 'R', 'ram@gmail.com', '123, 234 Street, XQ City', '9876543210'),
(2, 'Karthick', 'R', 'karthick@gmail.com', '456, 789 Avenue, MD City', '9123456789'),
(3, 'Ava', 'S', 'ava@gmail.com', '789, 101 Road, ABE City', '9988776655'),
(4, 'Sharmila', 'K', 'sharmila@gmail.com', '102, 303 Lane, GP City', '9988998877'),
(5, 'Kavin Kumar', 'P', 'kavin@gmail.com', '567, 890 Street, PQ City', '9776655443'),
(6, 'Praveen', 'P', 'praveen@gmail.com', '345, 678 Road, RS City', '9887766554'),
(7, 'Divya', 'V', 'divya@gmail.com', '234, 567 Street, UV City', '9666334455'),
(8, 'Karthik', 'S', 'karthik@gmail.com', '678, 123 Lane, LM City', '9444222333'),
(9, 'Meena', 'I', 'meena@gmail.com', '910, 112 Avenue, OP City', '9222333444'),
(10, 'Hari', 'V', 'hari@gmail.com', '234, 678 Street, XY City', '9000112233');
----
INSERT INTO Orders (OrderID, OrderDate, TotalAmount, CustomerID, OrderName)
VALUES
(101, '2025-04-01', 250.50, 1, 'Electronics Purchase'),
(102, '2025-04-02', 100.00, 2, 'Grocery Shopping'),
(103, '2025-04-03', 350.75, 3, 'Clothing and Accessories'),
(104, '2025-04-04', 500.00, 4, 'Furniture Purchase'),
(105, '2025-04-05', 75.20, 5, 'Books and Stationery'),
(106, '2025-04-06', 120.00, 6, 'Mobile Accessories'),
(107, '2025-04-07', 200.00, 7, 'Kitchen Appliances'),
(108, '2025-04-08', 180.50, 8, 'Home Decor'),
(109, '2025-04-09', 450.00, 9, 'Fitness Equipment'),
(110, '2025-04-10', 600.00, 10, 'Outdoor Gear');
(111, '2025-04-11', 800.00, 11, 'Outfit Shoe');
(112, '2025-04-12', 100.00, 12, 'Mobile Cover');
----
INSERT INTO Payments (PaymentID, PaymentDate, AmountPaid, OrderID)
VALUES
(1, '2025-04-01', 250.50, 101),
(2, '2025-04-02', 100.00, 102),
(3, '2025-04-03', 350.75, 103),
(4, '2025-04-04', 500.00, 104),
(5, '2025-04-05', 75.20, 105),
(6, '2025-04-06', 120.00, 106),
(7, '2025-04-07', 200.00, 107),
(8, '2025-04-08', 180.50, 108),
(9, '2025-04-09', 450.00, 109),
(10, '2025-04-10', 600.00, 110);
----
SELECT c.FirstName, o.OrderName,c.Phone, o.OrderID
FROM Customers AS c
JOIN Orders AS o ON c.CustomerID = o.CustomerID;
----
SELECT c.FirstName,c.Phone, o.OrderName, o.OrderId
FROM Customers AS c
LEFT JOIN Orders AS o ON c.CustomerID = o.CustomerID;
----
SELECT c.FirstName,c.Phone, o.OrderName, o.OrderID
FROM Customers AS c
RIGHT JOIN Orders AS o ON c.CustomerID = o.CustomerID;
----
SELECT c.FirstName,c.Phone, o.OrderName, o.OrderID
FROM Customers AS c
CROSS JOIN Orders AS o;
----
SELECT c.FirstName,c.Phone, o.OrderName, o.OrderID
FROM Customers AS c
NATURAL JOIN Orders AS o;
----
SELECT c.FirstName, o.OrderName,c.Phone, o.OrderID, p.`PaymentDate`, p.`AmountPaid`
FROM Customers AS c
LEFT JOIN Orders AS o ON c.CustomerID = o.CustomerID 
LEFT JOIN Payments AS p ON o.`OrderID` = p.`OrderID`
----


