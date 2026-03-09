CREATE TABLE employees (
emo_id SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL,
department VARCHAR(50) DEFAULT 'IT',
salary INT
);


INSERT INTO employees (name,department,salary)
VALUES
('Ubaid','IT',50000),
('Hassan','IT',60000),
('Adeel','IT',70000),
('Ahmad','HR',80000),
('Huzaifa','HR',90000);


CREATE INDEX idx_dept
ON employees(department);

CREATE INDEX idx_sal
ON employees(salary);

SELECT * FROM employees;

SELECT * FROM employees
WHERE department = 'IT';

SELECT * fROM employees
WHERE salary > 70000;

SELECT * FROM employees
WHERE salary = 90000;


CREATE INDEX idx_name_sal
ON employees(name,salary);

SELECT * FROM employees
WHERE name = 'Adeel'
AND salary = 70000;


ALTER TABLE employees
ADD COLUMN email VARCHAR(50) UNIQUE;

UPDATE employees
SET email = name || '@gmail.com';

SELECT * FROM employees;

CREATE INDEX idx_emp_hash
ON employees USING HASH(emo_id);