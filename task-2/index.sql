ALTER TABLE Employees
ADD Salary DECIMAL(10, 2)

UPDATE Employees
SET Salary = 75000.00
WHERE EmpId IN ('E001', 'E002', 'E003', 'E004');

UPDATE Employees
SET Salary = 85000.00
WHERE EmpId IN ('E005', 'E006', 'E007', 'E008');

UPDATE Employees
SET Salary = 90000.00
WHERE EmpId IN ('E009', 'E010');

INSERT INTO Employees (EmpId, FirstName, LastName, Email, Address, PhoneNo, DateOfBirth, JobTitle, Gender, Nationality, Salary)
VALUES
('E011', 'John', 'D', 'john@gmail.com', '123 Elm street, SD city', '5551234567', '1990-05-15', 'Sales', 'Male', 'Indian', 40000.00),
('E012', 'Smith', 'F', 'smith@gmail.com', '456 Oak street, Ml city', '5552345678', '1995-03-22', 'Sales', 'Male', 'American', 55000.00),
('E013', 'Karthick', 'M', 'karthick@gmail.com', '789 Pine street, IL city', '5553456789', '1982-07-30', 'Sales', 'Male','Indian', 70000.00)


SELECT EmpId, FirstName, LastName, Email, PhoneNo, JobTitle AS Department FROM Employees
WHERE LOWER(JobTitle) = LOWER('Sales');

SELECT EmpId, FirstName, LastName, Email, PhoneNo FROM Employees
ORDER BY LOWER(LastName) ASC;


SELECT EmpId, FirstName, LastName, Email, PhoneNo, Salary FROM Employees
ORDER BY Salary DESC;

SELECT EmpId, FIrstName, LastName, Email, PhoneNo, Salary, Nationality, Gender FROM Employees 
WHERE Salary >=60000.00 AND LOWER(Nationality) = LOWER('Indian')


SELECT EmpId, FirstName, LastName, Email, PhoneNo, Salary, Nationality, Gender, DateOfBirth, JobTitle
FROM Employees
WHERE ((Salary >= 90000.00 AND Salary <= 100000.00) 
       OR LOWER(Nationality) = LOWER('Indian'))
   OR LOWER(JobTitle) = LOWER('Front End Developer');


