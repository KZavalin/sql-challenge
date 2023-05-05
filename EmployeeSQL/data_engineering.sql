DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE salaries;
DROP TABLE titles;
DROP TABLE departments;
DROP TABLE employees;

CREATE TABLE employees (
  	emp_no INTEGER PRIMARY KEY,
  	emp_title VARCHAR(30),
 	birth_date date,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(1),
	hire_date date
);

CREATE TABLE departments (
	dept_no VARCHAR(30) PRIMARY KEY,
	dept_name VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE dept_emp (
 	emp_no INTEGER NOT NULL,
 	dept_no VARCHAR(30) NOT NULL,
  	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_manager (
 	dept_no VARCHAR(30) NOT NULL,
	emp_no INTEGER NOT NULL, 	
  	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries (
 	emp_no INTEGER PRIMARY KEY,
 	salary INTEGER NOT NULL,
  	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles (
 	title_id VARCHAR(30) PRIMARY KEY,
 	title VARCHAR(30) UNIQUE NOT NULL
);

COPY employees
FROM 'X:\Skynet\Documents\coding bootcamp\modules\sql-challenge\EmployeeSQL\data\employees.csv'
DELIMITER ','
CSV HEADER;

COPY departments
FROM 'X:\Skynet\Documents\coding bootcamp\modules\sql-challenge\EmployeeSQL\data\departments.csv'
DELIMITER ','
CSV HEADER;

COPY dept_emp
FROM 'X:\Skynet\Documents\coding bootcamp\modules\sql-challenge\EmployeeSQL\data\dept_emp.csv'
DELIMITER ','
CSV HEADER;

COPY dept_manager
FROM 'X:\Skynet\Documents\coding bootcamp\modules\sql-challenge\EmployeeSQL\data\dept_manager.csv'
DELIMITER ','
CSV HEADER;

COPY salaries
FROM 'X:\Skynet\Documents\coding bootcamp\modules\sql-challenge\EmployeeSQL\data\salaries.csv'
DELIMITER ','
CSV HEADER;

COPY titles
FROM 'X:\Skynet\Documents\coding bootcamp\modules\sql-challenge\EmployeeSQL\data\titles.csv'
DELIMITER ','
CSV HEADER;

