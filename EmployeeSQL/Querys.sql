--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary 
from employees e
inner join salaries s
on e.emp_no = s.emp_no;

--List employees who were hired in 1986.
SELECT e.emp_no, e.first_name, e.last_name, e.hire_date
FROM employees e
WHERE hire_date >= '1/1/1986'
AND hire_date <= '12/31/1986';

--List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name, and start and end employment dates.
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, de.from_date, de.to_date
FROM data_emp de
INNER JOIN departments d
ON de.dept_no = d.dept_no
INNER JOIN employees e
ON de.emp_no = e.emp_no
INNER JOIN dept_manager dm
ON de.emp_no = dm.emp_no
;

--List the department of each employee with the following information: employee number, last name, first name, 
--and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM data_emp de
INNER JOIN employees e
ON de.emp_no = e.emp_no
INNER JOIN departments d
ON de.dept_no = d.dept_no;

--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name like 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT d.dept_name, e.emp_no, e.last_name, e.first_name
FROM data_emp de
INNER JOIN employees e
ON de.emp_no = e.emp_no
INNER JOIN departments d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
;

--List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
SELECT d.dept_name, e.emp_no, e.last_name, e.first_name
FROM data_emp de
INNER JOIN employees e
ON de.emp_no = e.emp_no
INNER JOIN departments d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development'
;

--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
SELECT last_name, count(last_name) as count
FROM employees
GROUP BY last_name 
ORDER BY count DESC;