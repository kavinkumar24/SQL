
DELIMITER $$
CREATE PROCEDURE GetTotalOrderedAmount(startDate DATE, EndDate DATE)
BEGIN
SELECT SUM(TotalAmount) AS TotalSales FROM Orders WHERE 
OrderDate BETWEEN startDate AND EndDate;

END $$
DELIMITER ;
---

CALL GetTotalOrderedAmount('2025-04-01', '2025-04-30')
---

DELIMITER $$

CREATE FUNCTION SundaySpecialDiscount(amount DECIMAL(10,2), OrderDate DATE)
RETURNS DECIMAL(10,2)
BEGIN
    DECLARE discount DECIMAL(10,2);

    IF DATE_FORMAT(OrderDate, '%a') = 'Sun' THEN
        SET discount = amount * 0.20;
        RETURN amount - discount; 
    ELSE     
        RETURN amount;
    END IF;
END$$

DELIMITER ;

----

SELECT OrderId, OrderDate, DATE_FORMAT(OrderDate, '%a'), TotalAmount, CustomerID, 
SundaySpecialDiscount(TotalAmount, OrderDate) AS Discount FROM Orders
