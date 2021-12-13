# Pewlett-Hackard-Analysis

## Overview of Project

### Purpose
A company named Pewlett Hackard (PH) has hired a new data scientist (Bobby) to perform some data analysis in their database department.  After a few months of working with Bobby, I was able to prove that SQL is an awesome data analysis tool and they are on board utilizing SQL to perform data analysis.  PH is expecting a "silver tsunami" as many of their current employees reach retirement age.  A PH manager has delivered a few datasets for analysis and would like us to; (1) Determine the number of retiring employees per title and (2) Identify employees who are eligible to participate in the mentorship program.  We will summarize the analysis to help the PH manager prepare for this retirement tsunami.

The standard data analysis principles were used which includes; (1) Determine the number of rows and columns; (2) Data types used; and (3) Is the data readable?

PH expects the following deliverables:

- The Number of Retiring Employees by Title
- The Employees Eligible for the Mentorship Program
- PH Summary with responses for two (2) specific questions

## Resources

- PostgreSQL (A Relational Database Management System)
- pgAdmin (Interface to interact with PostgreSQL)

- Datasets used for Analysis:

  Employees Data source: [Employee Data](https://github.com/SheaButta/Pewlett-Hackard-Analysis/blob/main/Data/employees.csv)

  Deparments Data source: [Departments Data](https://github.com/SheaButta/Pewlett-Hackard-Analysis/blob/main/Data/departments.csv)

  Department Employee Data source: [Department Employee Data](https://github.com/SheaButta/Pewlett-Hackard-Analysis/blob/main/Data/dept_emp.csv)

  Deparment Managers Data source: [Deparment Managers Data](https://github.com/SheaButta/Pewlett-Hackard-Analysis/blob/main/Data/dept_emp.csv)

  Employee Salaries Data source: [Salaries Data](https://github.com/SheaButta/Pewlett-Hackard-Analysis/blob/main/Data/salaries.csv)

  Employee Titles Data source: [Titles Data](https://github.com/SheaButta/Pewlett-Hackard-Analysis/blob/main/Data/titles.csv)

  Database Environment Created
  ----------------------------
  - ERD Diagram (Physial)
  <img src="https://github.com/SheaButta/Pewlett-Hackard-Analysis/blob/main/EmployeeDB.png" width="500" height="500">

  - New Database Name:  PH-EmployeeDB

  - Database Schema: The database schema used to all related tables.
  [DDL to Create Table Object](https://github.com/SheaButta/Pewlett-Hackard-Analysis/blob/main/schema.sql)
 
 ----------------------------
 
## Results

The below bullets will display and describe the results captured; however, there were additional queries produced to assist with producing the expected PH results.  The additional queries are display/described below.

   **- QUERY written/executed to create a Retirement Titles table for employees who are born between January 1, 1952 and December 31, 1955.**
   ----------------------------------------------------------------------------------------------------------------------------------------
   <img src="https://github.com/SheaButta/Pewlett-Hackard-Analysis/blob/main/Queries/Create_Retirement_titles_table_query.PNG" width="800" height="400">
   
   **QUERY RESULTS:**
   
   <img src="https://github.com/SheaButta/Pewlett-Hackard-Analysis/blob/main/Queries/Retirement_titles_table_query_results.PNG" width="600" height="300">
     
  
  **- Query written/executed to create a Unique Titles table that contains the employee number, first and last name, and most recent title.**
  -----------------------------------------------------------------------------------------------------------------------------------------
  <img src="https://github.com/SheaButta/Pewlett-Hackard-Analysis/blob/main/Queries/Create_Unique_titles_table_query.PNG" width="800" height="400">
    
  **QUERY RESULTS:**
  
  <img src="https://github.com/SheaButta/Pewlett-Hackard-Analysis/blob/main/Queries/Unique_titles_table_query_results.PNG" width="800" height="400">
  
  
  **- Query is written and executed to create a Retiring Titles table that contains the number of titles filled by employees who are retiring.**
  --------------------------------------------------------------------------------------------------------------------------------------------
  <img src="https://github.com/SheaButta/Pewlett-Hackard-Analysis/blob/main/Queries/Create_Retiring_titles_table_query.PNG" width="800" height="400">
    
  **QUERY RESULTS:**
  
  <img src="https://github.com/SheaButta/Pewlett-Hackard-Analysis/blob/main/Queries/Retiring_titles_table_query_results.PNG" width="800" height="400">
  
  
  **- Query written/executed to create a Mentorship Eligibility table for current employees who were born between January 1, 1965 and December 31, 1965.**
  ------------------------------------------------------------------------------------------------------------------------------------------------------ 
  <img src="https://github.com/SheaButta/Pewlett-Hackard-Analysis/blob/main/Queries/Create_mentorship_eligibility_table_query.PNG" width="800" height="400">
    
  **QUERY RESULTS:**
  
  <img src="https://github.com/SheaButta/Pewlett-Hackard-Analysis/blob/main/Queries/Mentorship_eligibility_table_query_results.PNG" width="800" height="400">
  
## Summary
The data successfully analzed using the mentioned tools; additionally, there were no issue discovered with the exception of the titles table.  The analysis revealed that the titles table included duplicate employee numbers.  This specific analysis concluded; that although an employee left the company (identifed by the "date_to" column) the same employee(s) came back to work for PH under a different title and forced me to refactor title table schema.

The responses for the two specific questions from Pewlett Hackard's are:

  1. How many roles will need to be filled as the "silver tsunami" begins to make an impact?
     
     **Answer:**
     
     - 90,398 roles will need to be filled when this "silver tsunami" starts and visualized by the "Retiring Titles" image below.  Since we have visualized the "retiring            titles" we can easily sum the "count" column to determine the number of employees that will be retiring which is ultimately the number of roles that will need to              filled.  
     
     ![](https://github.com/SheaButta/Pewlett-Hackard-Analysis/blob/main/Queries/Retiring_titles_table_query_results.PNG)
     
     
     An additional query to sum the "column" would visualize the roles to be filled as a result of this "silver tsunami".
     
     ![](https://github.com/SheaButta/Pewlett-Hackard-Analysis/blob/main/Queries/Question1_SilverTsunami_NumOfRoles_ToFill.PNG)
     
  
     As I look at this data even deeer, you can use the below query to get the maximum birth date.  This will tell give you some insight into the age of PH employees and if        there are others that may be retiring soon.  The maximun birth_date for all employees is "1965-02-01".  
      **- SELECT MAX(emp.birth_date) FROM employees emp RIGHT JOIN dept_emp dept_emp ON (emp.emp_no = dept_emp.emp_no);**
    

  2. Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
     
     **Answer: Yes.**
     
     **- An additional query reveals the number of current employees per title.  As you can see an additional query was used to filter the data in the a table named                   active_employees.**
      
      ![](https://github.com/SheaButta/Pewlett-Hackard-Analysis/blob/main/Queries/Question2_CurrentActiveEmployees_query.PNG)
      
     **- The below query visualizes the acitve employees per deparment.**
    
      ![](https://github.com/SheaButta/Pewlett-Hackard-Analysis/blob/main/Queries/Question2_CurrentActiveEmployees_Results.PNG)
    
     **- This final visual displays the breakdown of retirement-ready employees ready to mentor the next generation.**
      
      ![](https://github.com/SheaButta/Pewlett-Hackard-Analysis/blob/main/Queries/Question2_Eligible_To_MentorNextGen.PNG)


