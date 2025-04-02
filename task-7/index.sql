SELECT
    EmpId,
    FirstName,
    LastName,
    Salary,
    JobTitle,
    ROW_NUMBER() OVER (PARTITION BY JobTitle ORDER BY Salary DESC) AS row_num
FROM
    employees;

----

SELECT
    EmpId,
    FirstName,
    LastName,
    Salary,
    JobTitle,
    RANK() OVER (PARTITION BY JobTitle ORDER BY Salary DESC) AS RANK
FROM
    employees;

----

SELECT
    EmpId,
    FirstName,
    LastName,
    Salary,
    JobTitle,
    DENSE_RANK() OVER (PARTITION BY JobTitle ORDER BY Salary DESC) AS DENSE_RANK
FROM
    employees;

----

SELECT
    EmpId,
    FirstName,
    LastName,
    Salary,
    JobTitle,
    LEAD(Salary) OVER (PARTITION BY JobTitle ORDER BY Salary DESC) AS next_salary
FROM
    employees;

----

SELECT
    EmpId,
    FirstName,
    LastName,
    Salary,
    JobTitle,
    LAG(Salary) OVER (PARTITION BY JobTitle ORDER BY Salary DESC) AS previous_salary
FROM
    employees;

----