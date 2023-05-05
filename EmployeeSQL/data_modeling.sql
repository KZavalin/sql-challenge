DROP VIEW QUESTION8;
DROP VIEW QUESTION7;
DROP VIEW QUESTION6;
DROP VIEW QUESTION5;
DROP VIEW QUESTION4;
DROP VIEW QUESTION3;
DROP VIEW QUESTION2;
DROP VIEW QUESTION1;

CREATE VIEW QUESTION1 AS
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees INNER JOIN salaries ON employees.emp_no=salaries.emp_no;

CREATE VIEW QUESTION2 AS
SELECT first_name, last_name, hire_date FROM employees
WHERE date_part('year', hire_date)=1986;

CREATE VIEW QUESTION3 AS
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, 
employees.last_name, employees.first_name
FROM dept_manager JOIN departments ON dept_manager.dept_no=departments.dept_no
JOIN employees ON dept_manager.emp_no=employees.emp_no;

CREATE VIEW QUESTION4 AS
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name 
FROM employees JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
JOIN departments ON dept_emp.dept_no=departments.dept_no;

CREATE VIEW QUESTION5 AS
SELECT first_name, last_name, sex FROM employees
WHERE first_name='Hercules' AND last_name LIKE 'B%';

CREATE VIEW QUESTION6 AS
SELECT employees.emp_no, employees.last_name, employees.first_name 
FROM employees
WHERE emp_no IN
	(SELECT emp_no FROM dept_emp WHERE dept_no IN
		(SELECT dept_no FROM departments WHERE dept_name='Sales'));

CREATE VIEW QUESTION7 AS
SELECT emp_no, last_name, first_name, dept_name
FROM QUESTION4
WHERE dept_name='Sales' OR dept_name='Development';

CREATE VIEW QUESTION8 AS
SELECT last_name, COUNT(last_name) AS "Count" FROM employees GROUP BY last_name ORDER BY last_name;

--ANSWER TO EACH QUESTION CAN BE VIEWED BY CHANGING
--THE QUESTION # IN THE QUERY BELOW TO THE RELEVANT NUMBER (1-8)
SELECT * FROM QUESTION#;