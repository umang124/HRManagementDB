USE HRManagementDB;

SELECT 
	employee_id,
	first_name,
	last_name,
	hire_date
FROM
	employees;

SELECT 
	first_name,
	last_name,
	salary,
	salary * 1.05 AS new_salary
FROM
	employees;

SELECT
	employee_id,
	first_name,
	last_name
FROM
	employees
ORDER BY
	first_name
OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;

SELECT 
	employee_id,
	first_name,
	last_name,
	salary
FROM
	employees
WHERE 
	salary BETWEEN 2500 AND 2900
ORDER BY
	salary DESC;

SELECT 
	employee_id,
	first_name,
	last_name,
	hire_date
FROM 
	employees
WHERE 
	hire_date BETWEEN '1999-01-01' AND '2000-12-31'
ORDER BY
	hire_date;

SELECT	
	department_id,
	department_name
FROM 
	departments
WHERE 
	department_id IN (1, 2, 3);							   


SELECT 
	first_name,
	last_name,
	job_title,
	department_name
FROM
	employees e
INNER JOIN departments d ON d.department_id = e.department_id
INNER JOIN jobs j ON j.job_id = e.job_id
WHERE 
	e.department_id IN (1, 2, 3);

SELECT 
	country_id,
	street_address,
	city
FROM 
	locations
WHERE 
	country_id IN ('US', 'UK', 'CN');

SELECT 
	c.country_name,
	c.country_id,
	l.street_address,
	l.city
FROM 
	countries c
LEFT JOIN locations l ON l.country_id = c.country_id
WHERE 
	c.country_id IN ('US', 'UK', 'CN');

SELECT
	country_name
FROM
	countries c
LEFT JOIN locations l ON l.country_id = c.country_id
WHERE
	l.location_id IS NULL
ORDER BY country_name;

-- SELF JOIN
SELECT 
	e.employee_id,
    e.first_name + ' ' + e.last_name AS employee,
    m.first_name + ' ' + m.last_name AS manager
FROM
    employees e
        LEFT JOIN
    employees m ON m.employee_id = e.manager_id
ORDER BY e.employee_id;

SELECT 
	d.department_name, ROUND(AVG(e.salary), 0) avg_salary
FROM 
	employees e
INNER JOIN departments d 
ON d.department_id = e.department_id
GROUP BY department_name;

-- Sub Query
SELECT 
	employee_id, first_name, last_name
FROM 
	employees
WHERE 
	department_id IN (
		SELECT department_id 
		FROM departments WHERE location_id = 1700
	);

SELECT
	employee_id, first_name, last_name, salary
FROM 
	employees
WHERE 
	salary = (
		SELECT MAX(salary)
		FROM employees)
ORDER BY first_name, last_name;





