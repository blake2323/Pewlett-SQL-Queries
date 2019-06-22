--View Tables
SELECT * FROM "Employees";
SELECT * FROM "Departments";
SELECT * FROM "Department_Manager";
SELECT * FROM "Dept_Emp";
SELECT * FROM "Salaries";
SELECT * FROM "Titles";


-- List Employee Info:
-- Employee#, First Name, Last Name, Gender, Salary
SELECT "Employees".emp_no AS Employee_number, "Employees".last_name, "Employees".first_name,
"Employees".gender, "Salaries".salary
FROM "Salaries"
INNER JOIN "Employees" ON
"Employees".emp_no="Salaries".emp_no;

--List Employees who were hired in 1986
SELECT last_name, first_name, hire_date FROM "Employees"
WHERE hire_date >= '1986-01-01'
AND hire_date < '1987-01-01';

--List all employees whose first name is "Hercules"
--and last name begins with "B"
SELECT last_name, first_name FROM "Employees"
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--List each manager's info:
--dept#, dept name, emp#, last name, first name, start and end employment dates
SELECT "Department_Manager".dept_no, "Departments".dept_name, 
"Department_Manager".emp_no, "Employees".last_name, "Employees".first_name,
"Department_Manager".from_date AS Start_employment,
"Department_Manager".to_date AS End_employment
FROM "Departments"
INNER JOIN "Department_Manager" ON "Department_Manager".dept_no="Departments".dept_no
INNER JOIN "Employees" ON "Employees".emp_no="Department_Manager".emp_no;

--List Employees Info:
--emp#, last name, first name, dept name
SELECT "Employees".emp_no, "Employees".last_name, "Employees".first_name,
"Departments".dept_name
FROM "Departments"
INNER JOIN "Dept_Emp" ON "Dept_Emp".dept_no="Departments".dept_no
INNER JOIN "Employees" ON "Employees".emp_no="Dept_Emp".emp_no;

--List employees in Sales Dept:
--emp#, last name, first name, dept name
SELECT "Employees".emp_no, "Employees".last_name, "Employees".first_name,
"Departments".dept_name
FROM "Departments"
INNER JOIN "Dept_Emp" ON "Dept_Emp".dept_no="Departments".dept_no
INNER JOIN "Employees" ON "Employees".emp_no="Dept_Emp".emp_no
WHERE "Departments".dept_name = 'Sales';

--List all employees in Sales or Development departments:
--emp#, last name, first name, dept name
SELECT "Employees".emp_no, "Employees".last_name, "Employees".first_name,
"Departments".dept_name
FROM "Departments"
INNER JOIN "Dept_Emp" ON "Dept_Emp".dept_no="Departments".dept_no
INNER JOIN "Employees" ON "Employees".emp_no="Dept_Emp".emp_no
WHERE "Departments".dept_name = 'Sales'
OR "Departments".dept_name = 'Development';

--List of frequency of employee last names in descending order:
SELECT last_name, COUNT(last_name) AS last_name_frequency 
FROM "Employees" GROUP BY last_name
ORDER BY last_name_frequency DESC; 