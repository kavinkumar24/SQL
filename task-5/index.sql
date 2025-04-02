SELECT FirstName, Salary, JobTitle
FROM Employees e1
WHERE Salary > (SELECT AVG(Salary) FROM Employees e2 WHERE e1.JobTitle = e2.JobTitle);

-----

SELECT 
    FirstName, 
    JobTitle, 
    Salary,
    (SELECT AVG(Salary) 
FROM Employees e2 
WHERE e2.JobTitle = e1.JobTitle) AS AvgJobSalary
FROM Employees e1;

-----

SELECT EmpId, FirstName, Email, PhoneNo, JobTitle, Salary, avg_sal.sal
FROM employees e
JOIN  (SELECT AVG(Salary) sal FROM employees) avg_sal
ON e.Salary > avg_sal.sal;

-----

SELECT EmpId, FirstName LastName, Email, PhoneNo, JobTitle, Salary AS `Maximum Salary`
FROM employees
WHERE (JobTitle, Salary) IN (SELECT JobTitle, MAX(Salary) 
FROM employees 
GROUP BY JobTitle);

-----
