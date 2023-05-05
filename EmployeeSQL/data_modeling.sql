DROP VIEW QUESTION1;
DROP VIEW QUESTION2;

CREATE VIEW QUESTION1 AS
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees INNER JOIN salaries ON employees.emp_no=salaries.emp_no;

CREATE VIEW QUESTION2 AS
SELECT first_name, last_name, hire_date FROM employees
WHERE date_part('year', hire_date)=1986;






SELECT * FROM QUESTION2;