DROP TABLE titles;
DROP TABLE departments;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE dept_emp;
DROP TABLE dept_manager;

CREATE TABLE titles (
    title_id VARCHAR PRIMARY KEY,
    title VARCHAR
);

CREATE TABLE departments (
    dept_no VARCHAR PRIMARY KEY,
    dept_name VARCHAR
);

CREATE TABLE employees (
 	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR REFERENCES titles (title_id),
	birth_date DATE,
	first_name VARCHAR,
    last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE			
);

CREATE TABLE salaries (
    emp_no INT,
    salary INT
);

CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR,
);

CREATE TABLE dept_manager (
    dept_no VARCHAR,
    emp_no INT, 
);