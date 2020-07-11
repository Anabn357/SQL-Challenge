 --1. List the following details of each employee:
-- from employees: employee number (emp_no), last name (last_name), first name (first_name), gender
-- from salaries: employee number (emp_no), salary
Select s.emp_no, e.last_name, e.first_name, e.gender, s.salary
From employees AS e
Inner join salaries AS s
On s.emp_no = e.emp_no
Order by s.emp_no;

-- 2. List employees who were hired in 1986

Select emp_no, last_name, first_name, hire_date 
From employees 
Where extract(year from hire_date) = 1986;

-- 3. List the manager of each department with the following information:

Select distinct On (dept_manager.dept_no) dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name,dept_manager.from_date, dept_manager.to_date
From dept_manager 
Inner Join departments 
On dept_manager.dept_no= departments.dept_no
Inner Join employees 
On dept_manager.emp_no = employees.emp_no
Order By dept_manager.dept_no, dept_manager.to_date DESC;

-- 4. List the department of each employee with the following information: 
Select distinct ON (e.emp_no) e.emp_no, e.last_name, e.first_name,d.dept_name
From employees AS e
Left join dept_emp AS de
On e.emp_no = de.emp_no
Inner join departments AS d
On de.dept_no = d.dept_no
Order By e.emp_no, de.to_date DESC;

-- 5. List all employees whose first name is "Hercules" 
--and last names begin with "B.

Select e.last_name, e.first_name
From employees AS e
Where (e.first_name = 'Hercules') AND (lower(e.last_name) like 'b%')
Order by e.last_name;

-- Create table with most current departments for each employee to use for #6 and #7 below:

Select distinct on (emp_no) *
Into current_dept_emp
From dept_emp
Order by emp_no, to_date DESC;

-- 6.List all employees in the Sales department, including their employee number

Select e.emp_no, e.last_name, e.first_name, d.dept_name
From employees AS e
Inner join current_dept_emp AS cde
On e.emp_no = cde.emp_no
Inner join departments AS d
On cde.dept_no = d.dept_no
Where lower(d.dept_name) = 'sales';

-- -- 7. List all employees in the Sales and Development departments, 

Select e.emp_no, e.last_name, e.first_name, d.dept_name
From employees AS e
Inner join current_dept_emp AS cde
On e.emp_no = cde.emp_no
Inner join departments AS d
On cde.dept_no = d.dept_no
Where (lower(d.dept_name) = 'sales') OR (lower(d.dept_name) = 'development');

-- 8. In descending order, list the frequency count of employee last names, 
Select last_name,Count(last_name) AS Frequency 
From employees 
Group by last_name
Order by frequency DESC;