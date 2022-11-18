-- queries

-- 1. 
SELECT e.emp_no, last_name, first_name, sex, salary
FROM employees AS e
INNER JOIN salaries ON salaries.emp_no=e.emp_no;

-- 2. 
SELECT first_name, last_name, hire_date
FROM employees 
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date;

-- 3. 
SELECT DM.dept_no, dept_name, DM.emp_no, last_name, first_name
FROM dept_manager AS DM
INNER JOIN departments ON departments.dept_no=DM.dept_no
INNER JOIN employees ON employees.emp_no=DM.emp_no;

-- 4.
SELECT dept_emp.emp_no, last_name, first_name, dept_name
FROM dept_emp
INNER JOIN employees ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON departments.dept_no=dept_emp.dept_no;

-- 5.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name='Hercules' AND last_name LIKE 'B%';

-- 6. 
SELECT employees.emp_no, last_name, first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON dept_emp.emp_no=employees.emp_no
INNER JOIN departments ON departments.dept_no=dept_emp.dept_no
WHERE employees.emp_no IN 
(
    SELECT emp_no   
    FROM dept_emp
    WHERE dept_no IN
    (
        SELECT dept_no
        FROM departments
        WHERE dept_name='Sales'
    )
);

-- 7.
SELECT employees.emp_no, last_name, first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON dept_emp.emp_no=employees.emp_no
INNER JOIN departments ON departments.dept_no=dept_emp.dept_no
WHERE employees.emp_no IN 
(
    SELECT emp_no   
    FROM dept_emp
    WHERE dept_no IN
    (
        SELECT dept_no
        FROM departments
        WHERE dept_name='Sales' OR dept_name='Development'
    )
);

-- 8.
SELECT last_name, COUNT(last_name) AS last_name_frequency
FROM employees
GROUP BY last_name
ORDER BY last_name_frequency DESC;

