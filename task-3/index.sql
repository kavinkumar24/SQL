SELECT COUNT(*) FROM employees

-------------------

SELECT 
    EmpId,
    FirstName,
    PhoneNo,
    Salary
FROM 
    employees
WHERE 
    Salary = (SELECT MIN(Salary) FROM employees);
    
-------------------

SELECT 
    EmpId,
    FirstName,
    PhoneNo,
    Salary
FROM 
    employees
WHERE 
    Salary = (SELECT MAX(Salary) FROM employees);
    
-------------------

SELECT 
    JobTitle, 
    GROUP_CONCAT(EmpId) AS EmployeeList 
FROM 
    employees 
GROUP BY 
    JobTitle

-------------------

SELECT 
    COUNT(EmpId) AS TotalEmployees,
    SUM(Salary) AS TotalSalary,
    AVG(Salary) AS AverageSalary
FROM 
    employees
    
-------------------
SELECT 
    JobTitle,
    COUNT(EmpId) AS TotalEmployees,
    SUM(Salary) AS TotalSalary,
    AVG(Salary) AS AverageSalary
FROM 
    employees
GROUP BY 
    JobTitle;
 
 -------------------
    
SELECT 
    Nationality, 
    Gender, 
    COUNT(Nationality) AS NationalityCount, 
    COUNT(Gender) AS GenderCount
FROM 
    employees
GROUP BY 
    Nationality, Gender;
 -------------------
    
SELECT 
    JobTitle,
    COUNT(EmpId) AS TotalEmployees,
    SUM(Salary) AS TotalSalary,
    AVG(Salary) AS AverageSalary
FROM 
    employees
GROUP BY 
    JobTitle
HAVING SUM(Salary)<=85000;

 -------------------
 
SELECT 
    JobTitle,
    Gender,
    COUNT(EmpId) AS TotalEmployees,
    SUM(Salary) AS TotalSalary,
    AVG(Salary) AS AverageSalary, 
    COUNT(Gender) AS GenderCount
FROM 
    employees
GROUP BY 
    JobTitle, Gender
HAVING AVG(Salary)>=75000 AND Gender = "Female"
