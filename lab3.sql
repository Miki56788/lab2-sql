-- 1. Create database called «lab3»
CREATE DATABASE lab3;

--3. Select the last name of all employees.
SELECT lastname FROM employees;

--4. Select the last name of all employees, without duplicates.
SELECT DISTINCT lastname FROM employees;

--5. Select all the data of employees whose last name is «Smith".
SELECT * FROM employees WHERE lastname = 'Smith';

--6. Select all the data of employees whose last name is "Smith" or «Doe".
SELECT * FROM employees WHERE lastname IN ('Smith', 'Doe');

--7. Select all the data of employees that work in department 14.
SELECT * FROM employees WHERE department = 14;

--8. Select all the data of employees that work in department 37 or department 77.
SELECT * FROM employees WHERE department IN (37, 77);

--9. Select the sum of all the departments' budgets.
SELECT SUM(budget) AS total_budget FROM departments;

--10. Select the number of employees in each department. You only
-- need to show the department code and the number of employees. (Use count(*) operator for counting the number of employees)ъ

SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department;

--11. Select the department code with more than 2 employees.
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 2;
--12. Select the name of the department with second highest budget.
SELECT name
FROM departments
ORDER BY budget DESC
LIMIT 1 OFFSET 1;

--13. Select the name and last name of employees working for
--departments with lowest budget.

 SELECT e.name, e.lastname
 FROM employees e
 JOIN departments d ON e.department = d.code
WHERE d.budget = (SELECT MIN(budget) FROM departments);

--14. Select the name of all employees and customers from Almaty.
SELECT name FROM  employees WHERE city = 'Almaty'
UNION
SELECT name FROM customers  WHERE city = 'Almaty';
--15. Select all departments with budget more than 60000, sorted by increasing budget and decreasing code
SELECT *
FROM departments
WHERE budget > 60000
ORDER BY budget ASC, code DESC;
--16. Reduce the budget of department with lowest budget by 10%.
UPDATE departments
SET budget = budget * 0.9
WHERE code = (SELECT code FROM departments ORDER BY budget ASC LIMIT 1);

--17. Reassign all employees from the Research department to the IT department.
UPDATE employees
SET department = 14
WHERE department = 77;

--18. Delete from the table all employees in the IT department.ё
    DELETE FROM employees
WHERE department = 14;

--19. Delete from the table all employees.

DELETE FROM employees;
