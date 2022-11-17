-- drop table if exists 
DROP TABLE titles;
DROP TABLE employees;
DROP TABLE departments;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE salaries;


-------------------
-- create tables -- 
-------------------

CREATE TABLE titles (
    title_id VARCHAR PRIMARY KEY,
    title VARCHAR
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

CREATE TABLE departments (
    dept_no VARCHAR PRIMARY KEY,
    dept_name VARCHAR
);

CREATE TABLE dept_emp (
    emp_no INT REFERENCES employees (emp_no),
    dept_no VARCHAR REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no,dept_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR REFERENCES departments (dept_no),
    emp_no INT REFERENCES employees (emp_no),
    PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE salaries (
    emp_no INT REFERENCES employees (emp_no),
    salary INT 
);
