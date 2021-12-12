# Pewlett-Hackard-Analysis

## Overview of Project

### Purpose
A company named Pewlett Hackard (PH) has hired a new data scientist (Bobby) to perform some data analysis in their database department.  After a few months of working with Bobby, I was able to prove that SQL is an awesome data analysis tool and they are on board utilizing SQL to perform data analysis.  PH is expecting a "silver tsunami" as many of their current employees reach retirement age.  A PH manager has delivered a few datasets for analysis and would like us to; (1) Determine the number of retiring employees per title and (2) Identify employees who are eligible to participate in the mentorship program.  We will summarize the analysis to help the PH manager prepare for this retirement tsunami.

The standard data analysis principles were used which includes; (1) Determine the number of rows and columns; (2) Data types used; and (3) Is the data readable?

PH expects the following deliverables:

- The Number of Retiring Employees by Title
- The Employees Eligible for the Mentorship Program

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

  - **Query written/executed to create a Retirement Titles table for employees who are born between January 1, 1952 and December 31, 1955.**
  ----------------------------------------------------------------------------------------------------------------------------------------
  ![Create Retirement titles table](https://github.com/SheaButta/Pewlett-Hackard-Analysis/blob/main/Queries/Create_Retirement_titles_table_query.PNG)
  
    - **Results from Retirement titles:**
    -----------------------------------
    
   ![Retirement titles table results](https://github.com/SheaButta/Pewlett-Hackard-Analysis/blob/main/Queries/Retirement_titles_table_query_results.PNG)
  

  Query written/executed to create a Unique Titles table that contains the employee number, first and last name, and most recent title.
  ------------------------------------------------------------------------------------------------------------------------------------------------
  ![Query to create Retiring titles table](https://github.com/SheaButta/Pewlett-Hackard-Analysis/blob/main/Queriesa/Create_Retiring_titles_table_query.PNG)
  
  ![Results from Retiring titles table](https://github.com/SheaButta/Pewlett-Hackard-Analysis/blob/main/Queries/Retiring_titles_table_query_results.PNG)
  
  
  - Query is written and executed to create a Retiring Titles table that contains the number of titles filled by employees who are retiring. 
  ------------------------------------------------------------------------------------------------------------------------------------------
  ![Query to create Unique_titles table](https://github.com/SheaButta/Pewlett-Hackard-Analysis/blob/main/Queries/Create_Unique_titles_table_query.PNG)
  
  ![Results from Unique titles table](https://github.com/SheaButta/Pewlett-Hackard-Analysis/blob/main/Queries/Unique_titles_table_query_results.PNG)
  
  
  - Query written/executed to create a Mentorship Eligibility table for current employees who were born between January 1, 1965 and December 31, 1965.
  ---------------------------------------------------------------------------------------------------------------------------------------------------- 
  ![Query to create Mentorship Eligibility table](https://github.com/SheaButta/Pewlett-Hackard-Analysis/blob/main/Data/Create_mentorship_eligibility_table_query.PNG)
  
  ![Results from Mentorship Eligibility table](https://github.com/SheaButta/Pewlett-Hackard-Analysis/blob/main/Data/Mentorship_eligibility_table_query_results.PNG)
  
## Summary



