---LAB-7---

CREATE TABLE EMP(
   EID INT,
   ENAME VARCHAR(50),
   DEPARTMENT VARCHAR(60),
   SALARY DECIMAL(8,2),
   JOININGDATE DATETIME,
   CITY VARCHAR(30)
);

INSERT INTO EMP VALUES(101,'RAHUL','ADMIN',56000,'1990-1-1','RAJKOT')
INSERT INTO EMP VALUES(102,'HARDIK','IT',18000,'1990-9-25','AHMEDABAD')
INSERT INTO EMP VALUES(103,'BHAVIN','HR',25000,'1991-5-14','BARODA')
INSERT INTO EMP VALUES(104,'BHOOMI','ADMIN',39000,'1991-2-8','RAJKOT')
INSERT INTO EMP VALUES(105,'ROHIT','IT',17000,'1990-7-23','JAMNAGAR')
INSERT INTO EMP VALUES(106,'PRIYA','IT',9000,'1990-10-18','AHMEDABAD')
INSERT INTO EMP VALUES(107,'BHOOMI','HR',34000,'1991-12-25','RAJKOT')

---PART-A--


---1) Display the Highest, Lowest, Label the columns Maximum, Minimum respectively.

SELECT MAX(SALARY) AS  MAX_SALARY,MIN(SALARY) AS MIN_SALARY
FROM EMP

--2) Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal,respectively.

SELECT SUM(SALARY) AS TOTAL_SALARY, AVG(SALARY) AS AVG_SALARY
FROM EMP

--3) Find total number of employees of EMPLOYEE table.

SELECT COUNT(ENAME) FROM EMP

--4) Find highest salary from Rajkot city.

SELECT MAX(SALARY) AS MAX_SALARY
FROM EMP
WHERE CITY = 'RAJKOT'

--5)  Give maximum salary from IT department.

SELECT MAX(SALARY) AS MAX_SALARY
FROM EMP
WHERE DEPARTMENT = 'IT'

--6) Count employee whose joining date is after 8-feb-91.

SELECT COUNT(*)
FROM EMP
WHERE JOININGDATE > '1991-2-8'

--7) Display average salary of Admin department.

SELECT AVG(SALARY) AS AVG_SALARY
FROM EMP
WHERE DEPARTMENT= 'ADMIN'

--8) Display total salary of HR department.

SELECT SUM(SALARY) AS TOTAL_SALARY
FROM EMP
WHERE DEPARTMENT = 'HR'

--9) Count total number of cities of employee without duplication.

SELECT COUNT(DISTINCT CITY) AS UNIQUE_CITY
FROM EMP

--10) Count unique departments.

SELECT COUNT(DISTINCT DEPARTMENT) AS UNIQUE_DEPARTMENT
FROM EMP

--11) Give minimum salary of employee who belongs to Ahmedabad.

SELECT MIN(SALARY) AS MIN_SALARY
FROM EMP
WHERE CITY = 'AHMEDABAD'

--12) Find city wise highest salary.

SELECT CITY ,MAX(SALARY) AS MAX_SALARY
FROM EMP
GROUP BY CITY

--13) Find department wise lowest salary.
SELECT DEPARTMENT,MIN(SALARY) AS MIN_SALARY
FROM EMP
GROUP BY DEPARTMENT

--14) Display city with the total number of employees belonging to each city.

SELECT CITY,COUNT(*)
FROM EMP
GROUP BY CITY

--15) Give total salary of each department of EMP table.


SELECT DEPARTMENT,SUM(SALARY)
FROM EMP
GROUP BY DEPARTMENT

--16)  Give average salary of each department of EMP table without displaying the respective department name.

SELECT AVG(SALARY)
FROM EMP
GROUP BY DEPARTMENT


---PART-B----

--1) Count the number of employees living in Rajkot.

SELECT COUNT(ENAME)
FROM EMP
WHERE CITY = 'RAJKOT'

--2) Display the difference between the highest and lowest salaries. Label the column DIFFERENCE.

SELECT MAX(SALARY)-MIN(SALARY) AS DIFFERENCE
FROM EMP

--3) Display the total number of employees hired before 1st January, 1991.

SELECT COUNT(ENAME)
FROM EMP
WHERE JOININGDATE < '1991-1-1'

----PART-C----

--1)  Count the number of employees living in Rajkot or Baroda.

SELECT COUNT(ENAME)
FROM EMP
WHERE CITY = 'RAJKOT' OR CITY = 'BARODA'

--2) Display the total number of employees hired before 1st January, 1991 in IT department.

SELECT COUNT(ENAME)
FROM EMP
WHERE JOININGDATE < '1991-1-1' AND DEPARTMENT = 'IT'

--3) Find the Joining Date wise Total Salaries.

SELECT JOININGDATE,SUM(SALARY) AS TOTAL_SALARY
FROM EMP
GROUP BY JOININGDATE

--4)  Find the Maximum salary department & city wise in which city name starts with ‘R’.

SELECT DEPARTMENT,CITY,MAX(SALARY) AS MAX_SALARY
FROM EMP
WHERE CITY LIKE 'R%'
GROUP BY DEPARTMENT,CITY





 











