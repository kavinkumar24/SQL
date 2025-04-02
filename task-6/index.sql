CREATE TABLE OrdersPlaced (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    ShipDate DATE,
    OrderAmount DECIMAL(10, 2)
);


INSERT INTO OrdersPlaced (OrderID, CustomerID, OrderDate, ShipDate, OrderAmount)
VALUES
(1, 101, '2025-03-15', '2025-03-18', 250.75),
(2, 102, '2025-03-20', '2025-03-22', 125.50),
(3, 103, '2025-03-25', '2025-03-28', 300.00),
(4, 104, '2025-04-01', '2025-04-05', 150.25),
(5, 105, '2025-04-10', '2025-04-12', 450.00),
(6, 106, '2025-04-12', '2025-04-14', 500.60),
(7, 107, '2025-04-15', '2025-04-18', 200.00),
(8, 108, '2025-04-18', '2025-04-20', 350.80);
(9, 109, '2025-02-20', '2025-03-15', 100.00);
(10, 110, '2025-03-20', '2025-03-30', 200.00);

SELECT OrderID, OrderDate, ShipDate, DATEDIFF(ShipDate, OrderDate) AS DaysToShip
FROM OrdersPlaced;

SELECT OrderID, OrderDate, ShipDate, DATE_ADD(ShipDate, INTERVAL 4 DAY) AS ExpectedDeliveryDate,
DATE_FORMAT(DATE_ADD(ShipDate, INTERVAL 4 DAY), "%a") AS ExpectedDeliveryDay
FROM OrdersPlaced;


SELECT OrderID, OrderDate, ShipDate, OrderAmount
FROM OrdersPlaced
WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY;


SELECT OrderID, 
       DATE_FORMAT(OrderDate, '%d/%m/%Y') AS FormatedOrderDate
FROM OrdersPlaced
WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY;

