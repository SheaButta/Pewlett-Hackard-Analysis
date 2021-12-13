/*
Module Challenge 7
*/

/*
################################################################
	Deliverable 1: The Number of Retiring Employees by Title
################################################################
*/

-- 1. Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT emp_no, first_name, last_name FROM employees;

-- 2. Retrieve the title, from_date, and to_date columns from the Titles table.
SELECT titles, from_date, to_date FROM titles;

-- 3. Create a new table using the INTO clause.
SELECT titles, from_date, to_date 
INTO titles_backup 
FROM titles;
SELECT * FROM titles_backup;

-- 4. Join both tables on the primary key.
SELECT 
	emp.emp_no,
	emp.first_name,
	emp.last_name,
	t.titles title,
	t.from_date,
	t.to_date
FROM employees emp
JOIN titles t on (emp.emp_no = t.emp_no);

/* 5. Filter the data on the birth_date column to retrieve the employees who 
	  were born between 1952 and 1955. Then, order by the employee number.
*/
SELECT 
emp.emp_no,
	emp.first_name,
	emp.last_name,
	t.titles title,
	t.from_date,
	t.to_date
FROM employees emp
INNER JOIN titles t on (emp.emp_no = t.emp_no)
WHERE emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp.emp_no asc;


/* 6. Export the Retirement Titles table from the previous step as 
      retirement_titles.csv and save it to your Data folder in the 
	  Pewlett-Hackard-Analysis folder.
*/
SELECT 
emp.emp_no,
	emp.first_name,
	emp.last_name,
	t.titles title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees emp
INNER JOIN titles t on (emp.emp_no = t.emp_no)
WHERE emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp.emp_no asc;

-- 7. Before you export your table, confirm that it looks correct:
SELECT * FROM retirement_titles;

/* 8. Copy the query from the Employee_Challenge_starter_code.sql and 
	  add it to your Employee_Database_challenge.sql file.

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
ORDER BY _____, _____ DESC;

*/


/*
	9. Retrieve the employee number, first and last name, and title columns 
	   from the Retirement Titles table.
*/

/*
	10. Use the DISTINCT ON statement to retrieve the first occurrence of the 
		employee number for each set of rows defined by the ON () clause.
*/
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
-- 11. Create a Unique Titles table using the INTO clause.
INTO unique_titles
FROM retirement_titles
/*
	12 Sort the Unique Titles table in ascending order by the employee 
	number and descending order by the last date (i.e., to_date) of the 
	most recent title.
*/
ORDER BY emp_no, to_date DESC;


/* 13. Export the Unique Titles table as unique_titles.csv and 
	  save it to your Data folder in the Pewlett-Hackard-Analysis folder.
	  
	  See unique_titles.csv file in Data folder.
*/
-- 14. Before you export unique_titles, confirm that it looks correct:
SELECT * FROM unique_titles;

/*
	15. Write another query in the Employee_Database_challenge.sql file to retrieve the
	number of employees by their most recent job title who are about to retire.
*/

-- 16. First, retrieve the number of titles from the Unique Titles table.
SELECT count(*), title 
-- 17. Then, create a Retiring Titles table to hold the required information.
INTO retiring_titles
FROM unique_titles
-- 18. Group the table by title, then sort the count column in descending order.
GROUP BY title
ORDER BY COUNT(*) DESC;

/* 19.
	Export the Retiring Titles table as retiring_titles.csv and save it to your 
	Data folder in the Pewlett-Hackard-Analysis folder.
	
	The retiring_titles.csv file can be found in the Data folder.
*/

-- 20. Before you export your table, confirm that the data is correct.
SELECT * FROM retiring_titles;

/*
########################################################################
	Deliverable 2: The Employees Eligible for the Mentorship Program
########################################################################
*/

-- 1. Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
SELECT emp_no, first_name, last_name, birth_date
FROM employees;

-- 2. Retrieve the from_date and to_date columns from the Department Employee table.
SELECT from_date, to_date
FROM dept_emp;

-- 3. Retrieve the title column from the Titles table.
SELECT titles title from titles;

/*
   4. Use a DISTINCT ON statement to retrieve the first occurrence of the employee number 
   	  for each set of rows defined by the ON () clause.
*/
SELECT DISTINCT ON(emp_no) emp_no, first_name, last_name, birth_date
FROM employees;

-- 5. Create a new table using the INTO clause.
SELECT DISTINCT ON(emp_no) emp_no, first_name, last_name, birth_date
INTO distinct_employees
FROM employees;
select * from distinct_employees;

-- 6. Join the Employees and the Department Employee tables on the primary key.
SELECT DISTINCT ON(emp_no)
	emp.emp_no, 
	emp.first_name, 
	emp.last_name, 
	emp.birth_date, 
	dept_emp.from_date, 
	dept_emp.to_date
FROM employees emp
INNER JOIN dept_emp dept_emp ON (emp.emp_no = dept_emp.emp_no);

-- 7. Join the Employees and the Titles tables on the primary key.
SELECT DISTINCT ON(emp_no)
	emp.emp_no, 
	emp.first_name, 
	emp.last_name, 
	emp.birth_date, 
	dept_emp.from_date, 
	dept_emp.to_date
FROM employees emp
INNER JOIN dept_emp dept_emp ON (emp.emp_no = dept_emp.emp_no)
INNER JOIN titles t ON emp.emp_no = t.emp_no;

/*
  8. Filter the data on the to_date column to all the current employees, then filter 
  	 the data on the birth_date columns to get all the employees whose birth dates are 
  	 between January 1, 1965 and December 31, 1965.
*/
SELECT DISTINCT ON (emp.emp_no)
	emp.emp_no, 
	emp.first_name, 
	emp.last_name, 
	emp.birth_date, 
	t.from_date,
	t.to_date,
	t.titles title
FROM employees emp
RIGHT JOIN dept_emp de on (emp.emp_no = de.emp_no)
INNER JOIN titles t ON (emp.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01') 
	AND (emp.birth_date BETWEEN '1965-01-01' AND '1965-12-31');
	
-- 9. Order the table by the employee number.
SELECT DISTINCT ON (emp.emp_no)
	emp.emp_no, 
	emp.first_name, 
	emp.last_name,
	emp.birth_date,
	de.from_date,
	de.to_date,
	t.titles title
FROM employees emp
RIGHT JOIN dept_emp de on (emp.emp_no = de.emp_no)
INNER JOIN titles t ON (emp.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01') 
	AND (emp.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp.emp_no;

/*
  10. Export the Mentorship Eligibility table as mentorship_eligibilty.csv 
  	  and save it to your Data folder in the Pewlett-Hackard-Analysis folder. */
SELECT DISTINCT ON (emp.emp_no)
	emp.emp_no, 
	emp.first_name, 
	emp.last_name,
	emp.birth_date,
	de.from_date,
	de.to_date,
	t.titles title
INTO mentorship_eligibilty
FROM employees emp
RIGHT JOIN dept_emp de on (emp.emp_no = de.emp_no)
INNER JOIN titles t ON (emp.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01') 
	AND (emp.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp.emp_no;


-- 11. Before you export your table, confirm that it looks correct.
SELECT * FROM mentorship_eligibilty;

-- ADDITIONAL QUERIES FOR SUMMARY
-- Get oldest birth_date of all employees.
SELECT MAX(emp.birth_date) FROM employees emp RIGHT JOIN dept_emp dept_emp ON (emp.emp_no = dept_emp.emp_no);

-- Capture all Current Employees in active_employee table
SELECT DISTINCT ON (emp.emp_no)
	emp.emp_no, 
	emp.first_name, 
	emp.last_name,
	emp.birth_date,
	de.from_date,
	de.to_date,
	t.titles title
INTO active_employees
FROM employees emp
RIGHT JOIN dept_emp de on (emp.emp_no = de.emp_no)
INNER JOIN titles t ON (emp.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01') 
ORDER BY emp.emp_no;


-- Visualize all Active Employee titles
select count(*), title
from active_employees
group by title
order by count(*) desc;



