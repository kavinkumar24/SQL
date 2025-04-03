CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    SalesAmount DECIMAL(10, 2),
    CustomerName VARCHAR(100),
    PhoneNumber VARCHAR(15)
);
----
INSERT INTO Sales (SaleID, ProductID, SalesAmount, CustomerName, PhoneNumber) VALUES
(1, 101, 15000.00, 'Kavin', '1234567890'),
(2, 102, 20000.00, 'Jane', '1234567891'),
(3, 101, 15500.00, 'Ava', '1234567892'),
(4, 103, 60000.00, 'Jack', '1234567893'),
(5, 102, 20250.00, 'Smith', '1234567894'),
(6, 104, 200000.00, 'Bolt', '1234567895'),
(7, 103, 70000.00, 'Virat', '1234567897');
----
CREATE TABLE ProductsName
(
ProductID INT PRIMARY KEY,
ProductName VARCHAR(255)
)

INSERT INTO ProductsName
VALUES
(101, 'Samsung M series'),
(102, 'One Plus Nord series'),
(103, 'Iphone 16 FE'),
(104, 'Vision Pro Max')
----

WITH ProductSales AS (
    SELECT
        ProductID,
        SUM(SalesAmount) AS TotalSales
    FROM
        Sales
    GROUP BY
        ProductID
),
AverageSales AS (
    SELECT
        AVG(TotalSales) AS AvgSales
    FROM
        ProductSales
)

SELECT
    p.ProductID,
    p.TotalSales,
    av.AvgSales,
    GROUP_CONCAT(s.CustomerName) AS CustomerNames
FROM
    ProductSales p
JOIN
    Sales s ON s.ProductID = p.ProductID
JOIN
    AverageSales av
ON
    p.TotalSales > av.AvgSales
GROUP BY
    p.ProductID, p.TotalSales, av.AvgSales
ORDER BY
    p.TotalSales DESC;
----
CREATE TABLE EmployeeHierarchy (
    EmpID VARCHAR(20) NOT NULL PRIMARY KEY,
    NAME VARCHAR(255) NOT NULL,
    PhoneNo VARCHAR(15) NULL,
    Email VARCHAR(255) NULL,
    ManagerID VARCHAR(20) NULL,
    POSITION VARCHAR(255) NULL
);
----
INSERT INTO EmployeeHierarchy (EmpID, NAME, PhoneNo, Email, ManagerID, POSITION) 
VALUES ('E001', 'John', '1234567890', 'john@gmail.com', NULL, 'CEO'),
('E002', 'Ramesh', '2345678901', 'ramesh@gmail.com', 'E001', 'Manager'),
('E003', 'Kumar', '3456789012', 'kumar@gmail.com', 'E001', 'Manager'),
('E004', 'Ram', '4567890123', 'ram@gmail.com', 'E002', 'Employee'),
('E005', 'Santhosh', '5678901234', 'santhosh@gmail.com', 'E003', 'Employee');
----
WITH RECURSIVE EmpHierarchy AS (
    SELECT EmpId, NAME,ManagerID, POSITION, 1 AS LEVEL
    FROM EmployeeHierarchy
    WHERE NAME = 'John'

    UNION ALL

    SELECT E.EmpId, E.Name, E.ManagerID, E.Position, H.Level + 1 AS LEVEL
    FROM EmployeeHierarchy E
    JOIN EmpHierarchy H ON E.ManagerID = H.EmpId
)

SELECT eh.EmpID, eh.Name, mn.Name AS ManagerName, eh.ManagerID, eh.Position, eh.Level
FROM EmpHierarchy eh
LEFT JOIN EmployeeHierarchy mn ON mn.EmpID = eh.ManagerID;
----