--LAB-3--


-- Create Department Table
CREATE TABLE Department (
 DepartmentID INT PRIMARY KEY,
 DepartmentName VARCHAR(100) NOT NULL UNIQUE
);
-- Create Designation Table
CREATE TABLE Designation (
 DesignationID INT PRIMARY KEY,
 DesignationName VARCHAR(100) NOT NULL UNIQUE
);
-- Create Person Table
CREATE TABLE Person (
 PersonID INT PRIMARY KEY IDENTITY(101,1),
 FirstName VARCHAR(100) NOT NULL,
 LastName VARCHAR(100) NOT NULL,
 Salary DECIMAL(8, 2) NOT NULL,
 JoiningDate DATETIME NOT NULL,
 DepartmentID INT NULL,
 DesignationID INT NULL,
 FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
 FOREIGN KEY (DesignationID) REFERENCES Designation(DesignationID)
);

---Part � A----

--1. Department, Designation & Person Table�s INSERT, UPDATE & DELETE Procedures.

--INSERT

CREATE OR ALTER PROCEDURE PR_DEPARTMENT_INSERT

   @DEPTID INT,
   @DEPTNAME VARCHAR(15)
AS
BEGIN
   INSERT INTO DEPARTMENT VALUES(@DEPTID,@DEPTNAME)
END


EXEC PR_DEPARTMENT_INSERT 1,'ADMIN'
EXEC PR_DEPARTMENT_INSERT 2,'IT'
EXEC PR_DEPARTMENT_INSERT 3,'HR'
EXEC PR_DEPARTMENT_INSERT 4,'ACCOUNT'

SELECT * FROM Department





CREATE OR ALTER PROCEDURE PR_DESIGNATION_INSERT

   @DESIGID INT,
   @DESIGNAME VARCHAR(15)
AS
BEGIN
   INSERT INTO Designation VALUES(@DESIGID,@DESIGNAME)
END

EXEC PR_DESIGNATION_INSERT 11,'jobber'
EXEC PR_DESIGNATION_INSERT 12,'welder'
EXEC PR_DESIGNATION_INSERT 13,'clerk'
EXEC PR_DESIGNATION_INSERT 14,'manager'
EXEC PR_DESIGNATION_INSERT 15,'ceo'

SELECT * FROM Designation

CREATE OR ALTER PROCEDURE PR_PERSON_INSERT

   @FIRSTNAME VARCHAR(15),
   @LASTNAME VARCHAR(15),
   @SALARY INT,
   @JOININGDATE DATETIME,
   @DEPARTMENTID INT,
   @DESIGNATIONID INT

AS
BEGIN
   INSERT INTO Person VALUES(@FIRSTNAME,@LASTNAME,@SALARY,@JOININGDATE,@DEPARTMENTID,@DESIGNATIONID)
END

EXEC PR_PERSON_INSERT 'RAHUL','ANSHU',56000,'1990-01-01',1,12
EXEC PR_PERSON_INSERT 'HARDIK','HINSU',18000,'1990-09-25',2,11
EXEC PR_PERSON_INSERT 'BHAVIN','KAMANI',25000,'1991-05-14',NULL,11
EXEC PR_PERSON_INSERT 'BHOOMI','PATEL',39000,'2014-02-20',1,13
EXEC PR_PERSON_INSERT 'ROHIT','RAJGOR',17000,'1990-07-23',2,15
EXEC PR_PERSON_INSERT 'PRIYA','MEHTA',25000,'1990-10-18',2,NULL
EXEC PR_PERSON_INSERT 'NEHA','TRIVEDI',18000,'2014-02-20',3,15

SELECT * FROM Person

--UPDATE

CREATE OR ALTER PROCEDURE PR_DEPARTMENT_UPDATE

   @DEPTID INT,
   @DEPTNAME VARCHAR(15)
AS
BEGIN
   UPDATE DEPARTMENT 
   SET DepartmentID=@DEPTID,DepartmentName=@DEPTNAME
   WHERE DepartmentID=@DEPTID
END

EXEC PR_DEPARTMENT_UPDATE 2,'DEEP'


CREATE OR ALTER PROCEDURE PR_DESIGNATION_UPDATE

   @DESIGID INT,
   @DESIGNAME VARCHAR(15)
AS
BEGIN
   UPDATE Designation 
   SET DesignationID=@DESIGID,DesignationName=@DESIGNAME
   WHERE DesignationID=@DESIGID
END

EXEC PR_DESIGNATION_UPDATE 11,'DEEP V'


CREATE OR ALTER PROCEDURE PR_Person_UPDATE
   @PersonID INT,
   @FIRSTNAME VARCHAR(15),
   @LASTNAME VARCHAR(15),
   @SALARY INT,
   @JOININGDATE DATETIME,
   @DEPARTMENTID INT,
   @DESIGNATIONID INT
AS
BEGIN
   UPDATE Person 
   SET Firstname=@FIRSTNAME,Lastname=@LASTNAME,Salary=@SALARY,JoiningDate=@JOININGDATE,DepartmentID=@DEPARTMENTID,DesignationID=@DESIGNATIONID
   WHERE PersonID=@PersonID
END

EXEC PR_Person_UPDATE 2,'DEEP','VAMJA',56000,'1990-01-14',12,11

--DELETE

CREATE OR ALTER PROCEDURE PR_DEPARTMENT_DELETE

   @DEPTID INT

AS
BEGIN
    DELETE FROM DEPARTMENT 
   WHERE DepartmentID=@DEPTID

END

EXEC PR_DEPARTMENT_DELETE 1


CREATE OR ALTER PROCEDURE PR_Designation_DELETE

   @DESIGID INT

AS
BEGIN
    DELETE FROM Designation
   WHERE DesignationID=@DESIGID
END

EXEC PR_Designation_DELETE 12


CREATE OR ALTER PROCEDURE PR_Person_DELETE

   @PersonID INT

AS
BEGIN
    DELETE FROM Person
   WHERE PersonID=@PersonID
END

EXEC PR_Person_DELETE 1









--2. Department, Designation & Person Table�s SELECTBYPRIMARYKEY 

CREATE OR ALTER PROCEDURE PR_DEPARTMENT_DEPTID
@DEPTID INT
AS
BEGIN
   SELECT * FROM Department WHERE DepartmentID=@DEPTID
END

EXEC PR_DEPARTMENT_DEPTID 12

CREATE OR ALTER PROCEDURE PR_Designation_DESIGID
@DESIGID INT
AS
BEGIN
   SELECT * FROM Designation WHERE DesignationID=@DESIGID
END

EXEC PR_Designation_DESIGID 11

CREATE OR ALTER PROCEDURE PR_Person_PersonID
@PersonID INT
AS
BEGIN
   SELECT * FROM Person WHERE PersonID=@PersonID
END

EXEC PR_Person_PersonID 1



--3. Department, Designation & Person Table�s (If foreign key is available then do write join and take columns on select list) 
CREATE OR ALTER PROCEDURE PR_DEPARTMENT_select

AS
BEGIN
   SELECT * FROM Department 
END

EXEC PR_DEPARTMENT_select


CREATE OR ALTER PROCEDURE PR_Designation_select

AS
BEGIN
   SELECT * FROM Designation 
END

EXEC PR_Designation_select

CREATE OR ALTER PROCEDURE PR_Person_select

AS
BEGIN
   SELECT P.PERSONID,P.FirstName,P.LastName,P.JoiningDate,P.Salary FROM Person P JOIN Department D
   ON P.DepartmentID= D.DepartmentID JOIN Designation DE
   ON P.DesignationID = DE.DesignationID
END

EXEC PR_Person_select

--4. Create a Procedure that shows details of the first 3 persons.

CREATE OR ALTER PROCEDURE PR_Person_detail
AS
BEGIN
    SELECT TOP 3 * FROM Person
END

EXEC PR_Person_detail

--Part � B---

-- 5. Procedure that takes department name as input and returns all workers in that department
CREATE PROCEDURE PR_Person_GetWorkersByDepartment
    @DepartmentName VARCHAR(100)
AS
BEGIN
    SELECT P.*
    FROM Person P
    JOIN Department D ON P.DepartmentID = D.DepartmentID
    WHERE D.DepartmentName = @DepartmentName;
END;

-- 6. Procedure that takes department name & designation name as input and returns worker details
CREATE PROCEDURE PR_Person_GetWorkersByDeptAndDesig
    @DepartmentName VARCHAR(100),
    @DesignationName VARCHAR(100)
AS
BEGIN
    SELECT P.FirstName, P.Salary, P.JoiningDate, D.DepartmentName
    FROM Person P
    JOIN Department D ON P.DepartmentID = D.DepartmentID
    JOIN Designation G ON P.DesignationID = G.DesignationID
    WHERE D.DepartmentName = @DepartmentName AND G.DesignationName = @DesignationName;
END;

-- 7. Procedure that takes first name as input and displays worker details with department & designation
CREATE PROCEDURE PR_Person_GetWorkerDetailsByFirstName
    @FirstName VARCHAR(100)
AS
BEGIN
    SELECT P.*, D.DepartmentName, G.DesignationName
    FROM Person P
    LEFT JOIN Department D ON P.DepartmentID = D.DepartmentID
    LEFT JOIN Designation G ON P.DesignationID = G.DesignationID
    WHERE P.FirstName = @FirstName;
END;

-- 8. Procedure that displays department-wise max, min & total salaries
CREATE PROCEDURE PR_Department_GetSalaryStats
AS
BEGIN
    SELECT D.DepartmentName, MAX(P.Salary) AS MaxSalary, MIN(P.Salary) AS MinSalary, SUM(P.Salary) AS TotalSalary
    FROM Person P
    JOIN Department D ON P.DepartmentID = D.DepartmentID
    GROUP BY D.DepartmentName;
END;

-- 9. Procedure that displays designation-wise average & total salaries
CREATE PROCEDURE PR_Designation_GetSalaryStats
AS
BEGIN
    SELECT G.DesignationName, AVG(P.Salary) AS AvgSalary, SUM(P.Salary) AS TotalSalary
    FROM Person P
    JOIN Designation G ON P.DesignationID = G.DesignationID
    GROUP BY G.DesignationName;
END;

-- Part-C

-- 10. Procedure that accepts Department Name and returns Person Count
CREATE PROCEDURE PR_Department_GetPersonCount
    @DepartmentName VARCHAR(100)
AS
BEGIN
    SELECT COUNT(*) AS PersonCount
    FROM Person P
    JOIN Department D ON P.DepartmentID = D.DepartmentID
    WHERE D.DepartmentName = @DepartmentName;
END;

-- 11. Procedure that takes a salary value as input and returns workers with salary > 25000
CREATE PROCEDURE PR_Person_GetWorkersWithSalaryAbove
    @Salary DECIMAL(8,2)
AS
BEGIN
    SELECT P.*, D.DepartmentName, G.DesignationName
    FROM Person P
    LEFT JOIN Department D ON P.DepartmentID = D.DepartmentID
    LEFT JOIN Designation G ON P.DesignationID = G.DesignationID
    WHERE P.Salary > @Salary;
END;

-- 12. Procedure to find the department with the highest total salary
CREATE PROCEDURE PR_Department_GetHighestTotalSalary
AS
BEGIN
    SELECT TOP 1 D.DepartmentName, SUM(P.Salary) AS TotalSalary
    FROM Person P
    JOIN Department D ON P.DepartmentID = D.DepartmentID
    GROUP BY D.DepartmentName
    ORDER BY TotalSalary DESC;
END;

-- 13. Procedure that takes a designation name and returns workers under that designation who joined within the last 10 years
CREATE PROCEDURE PR_Designation_GetRecentWorkers
    @DesignationName VARCHAR(100)
AS
BEGIN
    SELECT P.*, D.DepartmentName
    FROM Person P
    JOIN Designation G ON P.DesignationID = G.DesignationID
    JOIN Department D ON P.DepartmentID = D.DepartmentID
    WHERE G.DesignationName = @DesignationName AND P.JoiningDate >= DATEADD(YEAR, -10, GETDATE());
END;

-- 14. Procedure to list the number of workers in each department without a designation
CREATE PROCEDURE PR_Department_GetWorkersWithoutDesignation
AS
BEGIN
    SELECT D.DepartmentName, COUNT(P.PersonID) AS WorkerCount
    FROM Person P
    JOIN Department D ON P.DepartmentID = D.DepartmentID
    WHERE P.DesignationID IS NULL
    GROUP BY D.DepartmentName;
END;

-- 15. Procedure to retrieve details of workers in departments where average salary is above 12000
CREATE PROCEDURE PR_Department_GetHighAvgSalaryWorkers
AS
BEGIN
    SELECT P.*, D.DepartmentName
    FROM Person P
    JOIN Department D ON P.DepartmentID = D.DepartmentID
    WHERE D.DepartmentID IN (
        SELECT DepartmentID
        FROM Person
        GROUP BY DepartmentID
        HAVING AVG(Salary) > 12000
    );
END;

