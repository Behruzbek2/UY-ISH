CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    position VARCHAR(50) NOT NULL,
    salary NUMERIC(10, 2) NOT NULL,
    hire_date DATE NOT NULL,
    department_id INT NOT NULL
);

INSERT INTO employees (first_name, last_name, position, salary, hire_date, department_id)
VALUES
    ('Ali', 'Karimov', 'Manager', 3000, '2020-03-15', 1),
    ('Nodira', 'Toirova', 'Developer', 2500, '2021-05-10', 2),
    ('Shoxruh', 'Abdullayev', 'Designer', 2200, '2022-01-22', 3),
    ('Zarina', 'Abdullayeva', 'HR Specialist', 1800, '2019-11-11', 1),
    ('Jasur', 'Aliyev', 'Developer', 2400, '2023-02-01', 2);

CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

INSERT INTO departments (department_name)
VALUES
    ('Administration'),
    ('IT'),
    ('Design');

CREATE TABLE projects (
    id SERIAL PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    budget NUMERIC(15, 2) NOT NULL
);

INSERT INTO projects (project_name, start_date, end_date, budget)
VALUES
    ('New Website', '2023-01-10', '2023-06-30', 50000),
    ('Mobile App', '2022-08-15', '2023-03-20', 30000),
    ('CRM System', '2024-02-01', NULL, 60000);


    CONCAT(first_name, ' ', last_name) AS "Full Name"
FROM 
    employees;


SELECT 
    *
FROM 
    employees
ORDER BY 
    salary DESC;

SELECT 
    *
FROM 
    employees
WHERE 
    salary > 2500;


SELECT 
    *
FROM 
    employees
ORDER BY 
    salary DESC
LIMIT 3;


SELECT 
    *
FROM 
    employees
ORDER BY 
    salary DESC
FETCH FIRST 3 ROWS ONLY;


SELECT 
    *
FROM 
    employees
WHERE 
    salary IN (2400, 3000);

SELECT 
    *
FROM 
    employees
WHERE 
    salary BETWEEN 2000 AND 3000;

SELECT 
    *
FROM 
    employees
WHERE 
    first_name LIKE '%a%';

SELECT 
    *
FROM 
    projects
WHERE 
    end_date IS NULL;

SELECT 
    d.department_name AS "Department",
    AVG(e.salary) AS "Average Salary"
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.id
GROUP BY 
    d.department_name;
