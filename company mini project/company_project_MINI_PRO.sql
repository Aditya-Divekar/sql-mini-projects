-- Employee data Analysis System  mini pro

create database company_project;
use company_project;


CREATE TABLE employees (
    emp_id INT auto_increment PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50),
    joining_year YEAR
);

INSERT INTO employees (name, department, salary, city, joining_year) VALUES
('Amit','HR',30000,'Pune',2020),
('Neha','IT',60000,'Mumbai',2021),
('Rahul','IT',70000,'Delhi',2019),
('Sneha','Finance',50000,'Pune',2022),
('Karan','HR',35000,'Mumbai',2020),
('Priya','IT',65000,'Pune',2021),
('Vikas','Finance',48000,'Delhi',2018),
('Anjali','HR',32000,'Pune',2023),
('Rohit','IT',72000,'Mumbai',2019),
('Pooja','Finance',51000,'Delhi',2022),
('Arjun','IT',68000,'Bangalore',2020),
('Meena','HR',31000,'Chennai',2021),
('Suresh','Finance',47000,'Hyderabad',2019),
('Kavita','IT',75000,'Pune',2022),
('Nikhil','HR',34000,'Mumbai',2023),
('Deepak','Finance',52000,'Delhi',2021),
('Ritika','IT',67000,'Bangalore',2020),
('Manoj','HR',36000,'Pune',2018),
('Simran','Finance',49000,'Chennai',2022),
('Tarun','IT',71000,'Hyderabad',2019),
('Komal','HR',33000,'Mumbai',2021),
('Aakash','IT',69000,'Pune',2020),
('Rekha','Finance',53000,'Delhi',2023),
('Varun','IT',74000,'Bangalore',2022),
('Seema','HR',30000,'Chennai',2019),
('Harish','Finance',46000,'Hyderabad',2018),
('Divya','IT',66000,'Mumbai',2021),
('Yash','HR',35000,'Pune',2022),
('Preeti','Finance',50000,'Delhi',2020),
('Kunal','IT',72000,'Bangalore',2019),
('Shreya','HR',32000,'Mumbai',2023),
('Ankit','IT',68000,'Pune',2021),
('Ramesh','Finance',54000,'Chennai',2020),
('Pallavi','IT',76000,'Hyderabad',2022),
('Gaurav','HR',34000,'Delhi',2019),
('Neelam','Finance',47000,'Mumbai',2021),
('Sanjay','IT',70000,'Pune',2020),
('Isha','HR',31000,'Bangalore',2022),
('Vivek','Finance',52000,'Delhi',2023),
('Alok','IT',73000,'Chennai',2019),
('Tina','HR',33000,'Hyderabad',2020),
('Mohit','IT',69000,'Mumbai',2021),
('Ritu','Finance',51000,'Pune',2022),
('Sameer','IT',75000,'Delhi',2023),
('Jyoti','HR',30000,'Chennai',2018),
('Kishore','Finance',48000,'Hyderabad',2019),
('Naina','IT',67000,'Bangalore',2020),
('Ashok','HR',36000,'Mumbai',2021),
('Pankaj','Finance',55000,'Delhi',2022),
('Zoya','IT',78000,'Pune',2023);

SELECT * FROM EMPLOYEES;


-- Q1.  FIND 2ND HIGHEST SALARY


SELECT MAX(salary) AS SecondHIGH
FROM EmployeeS
WHERE salary < (SELECT MAX(salary) FROM EmployeeS);

SELECT DISTINCT NAME , SALARY
FROM EMPLOYEES 
ORDER BY SALARY DESC
LIMIT 1  OFFSET 1 ; 

SELECT NAME, SALARY
FROM  ( SELECT NAME, SALARY,
		ROW_NUMBER() OVER (ORDER BY SALARY DESC) as rn
		FROM EMPLOYEES
) AS temp
WHERE rn = 4;

SELECT NAME, SALARY
FROM  ( SELECT NAME, SALARY,
		DENSE_RANK() OVER (ORDER BY SALARY DESC) as rn
		FROM EMPLOYEES
) AS TEMP
WHERE rn = 2;

-- 2 Q LOWEST SALARY

SELECT DISTINCT NAME , SALARY
FROM EMPLOYEES 
ORDER BY SALARY ASC
LIMIT 1  OFFSET 2 ; 

-- Q3. FIND HIGHEST SALAARY IN EACH DEPART

SELECT department, MAX(SALARY) AS MAX_SALARY
FROM EMPLOYEES
GROUP BY department 
ORDER BY SALARY DESC;


-- Q4. FIND EMPLOYEE HAVE SAME SALARY

SELECT NAME, SALARY
FROM EMPLOYEES
WHERE SALARY IN (
    SELECT SALARY
    FROM EMPLOYEES
    GROUP BY SALARY
    HAVING COUNT(SALARY) > 1
)
ORDER BY SALARY ASC;

SELECT SALARY , COUNT(EMP_ID)
FROM EMPLOYEES
GROUP BY SALARY 
HAVING COUNT(EMP_ID) >1 
ORDER BY SALARY DESC;

-- Q5 .FIND EMPLOYEE JOIN IN SAME year

SELECT NAME, joining_year
FROM EMPLOYEES
WHERE JOINING_YEAR IN(
	SELECT joining_year
    FROM EMPLOYEES
    GROUP BY JOINING_YEAR
    HAVING COUNT(JOINING_YEAR) > 1
    )
    ORDER BY joining_year ASC;

SELECT  JOINING_YEAR , COUNT(EMP_ID)
FROM EMPLOYEES
GROUP BY JOINING_YEAR
HAVING COUNT(EMP_ID) >1 
ORDER BY JOINING_YEAR DESC;


-- Q6. FIND TOP 3 PAID EMPLOYEES

SELECT NAME , SALARY
FROM EMPLOYEES 
ORDER BY SALARY DESC 
LIMIT 3;



-- Q7. FIND DEPARTMENT WIT HIGH AVG SALARY

SELECT DEPARTMENT , AVG(SALARY) AS AVG_SAL
FROM EMPLOYEES
GROUP BY DEPARTMENT
ORDER BY AVG_SAL DESC 
LIMIT 1;

-- Q8. FIND EMPLOYEE NOT FROM PUNE O R MUMBAI

SELECT * FROM EMPLOYEES
WHERE CITY NOT IN ('PUNE','MUMBAI');



-- Q9. FIND NO OF EMPLOYEE IN EACH CITY DESC ORDER

SELECT CITY , COUNT(NAME) AS TOT
FROM EMPLOYEES 
GROUP BY CITY
ORDER BY TOT DESC;


-- 10. FIND EMPLO WHOSE NAME LENGTH > 5

SELECT NAME FROM EMPLOYEES
WHERE LENGTH(NAME) > 5;

