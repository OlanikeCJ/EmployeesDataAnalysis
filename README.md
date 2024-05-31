# EmployeesDataAnalysis

## Project Purpose

The Employee dataset was obtained from a just-concluded Data Analysis BootCamp I participated in. This simple scenario-based project aims to explore the Employees Data to understand the number of employees in CodeNow Ltd, and their departments, and ascertain the oldest and newest employees in the company. 

## Scenario

As a member of the data team in CodeNow LTD, the team lead asked you to retrieve the following information from the employees and job table which has already been collected. However, the table has not yet been imported into the server. Import these tables into the server and retrieve this information.


## About Data

For this project, I worked with two datasets:

> 1. **Employeesdata**

which displays each employee's personal information, hire date, remuneration, department and line manager information. The data contains 11 columns and 49 rows. 

![image](https://github.com/OlanikeCJ/EmployeesDataAnalysis/assets/171288792/0b4034dc-9d87-466c-bba9-0625d44d3499)

> 2. **Jobsdata**

which displays the job_id and title of each employee. The data contains 2 columns and 49 rows.

![image](https://github.com/OlanikeCJ/EmployeesDataAnalysis/assets/171288792/baa033a6-15d5-4c30-a96e-f9924b2c4eed)

## Approach Used

1. **Data Wrangling**: This is the first step where inspection of data is done to make sure NULL values and missing values are detected and data replacement methods are used to replace missing or NULL values.
> * Build a database
> * Create a table and insert the data.
> * Select columns with null values in them. There are no null values in our database as in creating the tables, we set NOT NULL for each field, hence null values are filtered out.

2. **Exploratory Data Analysis (EDA)**: Exploratory data analysis is done to answer the listed questions and aims of this project.

3. **Conclusion**:

## Business Questions To Answer

1. The total number of employees in the company
2. The total number of employees in each department
3. The three departments with the highest number of employees
4. Who are the oldest and newest employees? Also, retrieve the date they joined the company and all information about them.
5. The oldest and newest employee in each department. Hint: Use the Row_number Function and CTE
6. The total number of information technology programmers in the company. Hint: Use the join statement
7. The year difference between the date the oldest and newest employee joined the company.
8. Who are the employees who earn below average? Retrieve their salaries and also their job title. Hint: Subquery is required
9. Update the strings of the email column to the lowercase letters.
10. You noticed that the commission column is empty. Delete the column from the table.

## Code

For the rest of the code, check the (add SQL query file path here)

```sql
-- Create Database
CREATE DATABASE IF NOT EXISTS EmployeeData;

-- Create Table 1
CREATE TABLE IF NOT EXISTS employeesdata(
employee_id CHAR(3) NOT NULL PRIMARY KEY,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
email VARCHAR(30) NOT NULL,
phone_number CHAR(30) NOT NULL,
hire_date DATE NOT NULL,
job_id VARCHAR(30) NOT NULL,
salary INT NOT NULL,
commission_pct INT NULL,
manager_id CHAR(3),
department_id INT NOT NULL
);

-- Create Table 2
CREATE TABLE IF NOT EXISTS jobs(
job_id VARCHAR(30) NOT NULL PRIMARY KEY,
job_title VARCHAR(255) NOT NULL
);
```
    
