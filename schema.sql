-- Drop tables with dependencies (CASCADE)
DROP TABLE IF EXISTS employee_table.titles CASCADE;
DROP TABLE IF EXISTS employee_table.employees CASCADE;
DROP TABLE IF EXISTS employee_table.departments CASCADE;
DROP TABLE IF EXISTS employee_table.dept_manager CASCADE;
DROP TABLE IF EXISTS employee_table.dept_emp CASCADE;
DROP TABLE IF EXISTS employee_table.salaries CASCADE;

-- Now recreate the schema and tables
CREATE SCHEMA IF NOT EXISTS employee_table;

CREATE TABLE employee_table.titles (
    title_id varchar(5) PRIMARY KEY,
    title varchar(30)
);

CREATE TABLE employee_table.employees (
    emp_no varchar(10) PRIMARY KEY,
    emp_title_id varchar(5) references employee_table.titles(title_id),
    birth_date date,
    first_name varchar(45),
    last_name varchar(45),
    sex varchar(1),
    hire_date date
);
SELECT * FROM employee_table.titles LIMIT 10;
SELECT * FROM employee_table.employees LIMIT 10;
SELECT * FROM employee_table.departments LIMIT 10;


CREATE TABLE employee_table.departments (
    dept_no varchar(5) PRIMARY KEY,
    dept_name varchar(30)
);

CREATE TABLE employee_table.dept_manager (
    dept_no varchar(5) references employee_table.departments(dept_no),
    emp_no varchar(10)
);

CREATE TABLE employee_table.dept_emp (
    emp_no varchar(10) references employee_table.employees(emp_no),
    dept_no varchar(5) references employee_table.departments(dept_no)
);

CREATE TABLE employee_table.salaries (
    emp_no varchar(10) references employee_table.employees(emp_no),
    salary int
);
