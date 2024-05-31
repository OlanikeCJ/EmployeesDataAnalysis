CREATE DATABASE IF NOT EXISTS EmployeeData;

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

USE EmployeeData;
CREATE TABLE IF NOT EXISTS jobs(
job_id VARCHAR(30) NOT NULL PRIMARY KEY,
job_title VARCHAR(255) NOT NULL
);

DROP TABLE jobs;

SELECT * FROM job;
SELECT * FROM employeesdata;

#1----The total number of employees in the company
SELECT 
    COUNT(employee_id) AS employee_id
FROM
    employeesdata;


#2----The total number of employees in each department
SELECT 
    COUNT(e.department_id) AS no_of_employees, e.job_id, j.job_title
FROM
    employeesdata e
        JOIN
    job j ON e.job_id = j.job_id
GROUP BY e.job_id , j.job_title;


#3----The three departments with the highest number of employees
SELECT 
    COUNT(e.job_id) AS no_of_employees, j.job_title
FROM
    employeesdata e
        JOIN
    job j ON e.job_id = j.job_id
GROUP BY e.job_id , j.job_title
ORDER BY no_of_employees DESC
LIMIT 3;

#4------Who are the oldest and newest employees? Also retrieve the date they joined the company and all the information about them. 
 
SELECT 
    *
FROM
    employeesdata
GROUP BY employee_id
ORDER BY hire_date DESC;


#5------The newest employee hire year
SELECT 
    MAX(YEAR(hire_date))
FROM
    employeesdata;

#USING SUBQUERY
SELECT 
    e.*
FROM
    employeesdata e
JOIN
    (SELECT 
        employee_id, MAX(hire_date) AS max_hire_date
     FROM 
        employeesdata
     GROUP BY 
        employee_id) sub
ON 
    e.employee_id = sub.employee_id AND e.hire_date = sub.max_hire_date
ORDER BY 
    e.hire_date DESC;


#6-------The oldest and newest employee in each department. Hint: use CTE(COMMON TABLE EXPRESSION) AND ROW_NUMBER
#Oldest employee
WITH Oldest_Employee AS (
SELECT first_name, last_name, employee_id, department_id, job_title, hire_date,
ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY hire_date ASC) AS row_no
FROM employeesdata e
JOIN job j ON e.job_id =j.job_id
)
SELECT first_name, last_name, employee_id, department_id, job_title, hire_date
FROM Oldest_Employee WHERE row_no = 1 ORDER BY hire_date ASC;

#newest employee
WITH Newest_Employee AS (
SELECT first_name, last_name, employee_id, department_id, job_title, hire_date,
ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY hire_date DESC) AS row_no
FROM employeesdata e
JOIN job j ON e.job_id =j.job_id
)
SELECT first_name, last_name, employee_id, department_id, job_title, hire_date
FROM Newest_Employee WHERE row_no = 1 ORDER BY hire_date DESC;

#OR 
SELECT 
    department_id,
    j.job_title,
    MAX(hire_date) AS hire_date
FROM
    employeesdata e
        JOIN
    job j ON e.job_id = j.job_id
GROUP BY department_id, j.job_title
ORDER BY hire_date DESC;


#7------The total number of Information Technology programmers in the company. 

SELECT 
    first_name, last_name, department_id, job_title
FROM
    employeesdata e
        JOIN
    job j ON e.job_id = j.job_id
WHERE
    job_title = 'Information technology Programmer'
    
#8------The year difference between the date the oldest and newest employee joined the company. 

SELECT
    MAX(YEAR(hire_date)) - MIN(YEAR(hire_date)) AS year_difference
FROM
    employeesdata;
    
#9--------Who are the employees that earn below average? Retrieve their salary and job title. HINT: Subquery is required.
#couldn't think of a better way to solve this.
SELECT 
   first_name, last_name, salary, j.job_title
FROM
    employeesdata e
        JOIN
    job j ON e.job_id = j.job_id
WHERE
    salary IN (SELECT 
            ROUND(AVG(salary), 2) AS salary
        FROM
            employeesdata
        GROUP BY salary
        HAVING salary < '5818.69');


#10-------update the strings of the email column to lower case letter
SELECT * FROM employeesdata;

UPDATE employeesdata
SET email = LOWER(email);


#11------You noticed that the commission column is empty. Delete the column from the table. 

ALTER TABLE employeesdata
DROP COLUMN commission_pct;
    
