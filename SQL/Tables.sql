-- -- Create employees Table
Create Table employees (
	emp_no INT PRIMARY KEY NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(32) NOT NULL,
	last_name VARCHAR(32) NOT NULL,
	gender VARCHAR(1)NOT NULL,
	hire_date DATE NOT NULL
);

-- Create departments table
Create Table departments (
	dept_no VARCHAR(8) Primary Key NOT NULL,
	dept_name VARCHAR(32) NOT NULL
);

-- -- Create titles Table
Create Table titles (
	emp_no INT NOT NULL,
	title VARCHAR(32) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
    Foreign Key (emp_no) references employees (emp_no)
);

-- -- Create department employee Table
Create Table dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(8) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
    Foreign Key (emp_no) references employees (emp_no),
    Foreign Key (dept_no) references departments (dept_no)
);

-- Create salaries Table
Create Table salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
    Foreign Key (emp_no) references employees (emp_no)
);

-- Create Department manager Table
Create Table dept_manager (
	dept_no VARCHAR(8) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
    Foreign Key (emp_no) references employees (emp_no),
    Foreign Key (dept_no) references departments (dept_no)
);

-- Change to_date years that hold year 9999 to current date for dept_manager,
-- dept emp, and titles (salaries table does not have 9999 year)
Update dept_manager
Set to_date = CURRENT_DATE
Where extract(year from to_date) = 9999;

Update dept_emp
Set to_date = CURRENT_DATE
Where extract(year from to_date) = 9999;

Update titles
Set to_date = CURRENT_DATE
Where extract(year from to_date) = 9999;
