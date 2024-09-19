---LAB-9--------


CREATE TABLE STUDENT_DATA(
NO INT,
NAME VARCHAR(50),
CITY VARCHAR(50),
DID INT
)

INSERT INTO STUDENT_DATA VALUES(101,'RAJU','RAJKOT',10)
INSERT INTO STUDENT_DATA VALUES(102,'AMIT','AHMEDABAD',20)
INSERT INTO STUDENT_DATA VALUES(103,'SANJAY','BARODA',40)
INSERT INTO STUDENT_DATA VALUES(104,'NEHA','RAJKOT',20)
INSERT INTO STUDENT_DATA VALUES(105,'MEERA','AHMEDABAD',30)
INSERT INTO STUDENT_DATA VALUES(106,'MAHESH','BARODA',10)

SELECT * FROM STUDENT_DATA

CREATE TABLE ACADEMIC(
	RNO INT,
	SPI FLOAT,
	BKLOG INT,
)

INSERT INTO ACADEMIC VALUES(101,8.8,0)
INSERT INTO ACADEMIC VALUES(102,9.2,2)
INSERT INTO ACADEMIC VALUES(103,7.6,1)
INSERT INTO ACADEMIC VALUES(104,8.2,4)
INSERT INTO ACADEMIC VALUES(105,7.0,2)
INSERT INTO ACADEMIC VALUES(106,8.9,3)

SELECT * FROM ACADEMIC

CREATE TABLE DEPARTMENT(
	DID INT,
	DNAME VARCHAR(10)
)

INSERT INTO DEPARTMENT VALUES(10,'COMPUTER')
INSERT INTO DEPARTMENT VALUES(20,'ELECTRICAL')
INSERT INTO DEPARTMENT VALUES(30,'MECHANICAL')
INSERT INTO DEPARTMENT VALUES(40,'CIVIL')

SELECT * FROM DEPARTMENT


------------------------------------------------------------------
--PART-A---



--1) Display details of students who are from computer department.

SELECT NAME FROM STUDENT_DATA
WHERE DID=(SELECT DID FROM DEPARTMENT WHERE DNAME='COMPUTER') 

--2) Displays name of students whose SPI is more than 8.

SELECT NAME FROM STUDENT_DATA 
WHERE NO IN (SELECT RNO FROM ACADEMIC WHERE SPI>8)

--3) Display details of students of computer department who belongs to Rajkot city.
TRUNCATE TABLE STUDENT_DATA

SELECT * FROM STUDENT_DATA 
WHERE DID = (SELECT DID FROM DEPARTMENT WHERE DNAME='COMPUTER') AND CITY='RAJKOT'

--4) Find total number of students of electrical department.
SELECT COUNT(NO) FROM STUDENT_DATA
WHERE DID=(SELECT DID FROM DEPARTMENT WHERE DNAME='ELECTRICAL')

--5) Display name of student who is having maximum SPI.

SELECT NAME FROM STUDENT_DATA 
WHERE NO IN
(SELECT RNO FROM ACADEMIC WHERE SPI =
(SELECT MAX(SPI) FROM ACADEMIC))

--6) Display details of students having more than 1 backlog.

SELECT NAME FROM STUDENT_DATA
WHERE NO IN (SELECT RNO FROM ACADEMIC WHERE BKLOG>1)

--PART-B----

--1) Display name of students who are either from computer department or from mechanical department.

SELECT NAME FROM STUDENT_DATA
WHERE DID 
IN (SELECT DID FROM DEPARTMENT WHERE DNAME='COMPUTER' OR
DNAME='MECHANICAL')

--2) Display name of students who are in same department as 102 studying in.

SELECT NAME FROM STUDENT_DATA
WHERE DID IN (SELECT DID FROM DEPARTMENT WHERE 
DID IN(SELECT DID FROM DEPARTMENT WHERE DNAME='ELECTRICAL'))

--PART-C---

--1) Display name of students whose SPI is more than 9 and who is from electrical department.

SELECT NAME FROM  STUDENT_DATA
WHERE NO IN (SELECT RNO FROM ACADEMIC  WHERE SPI>9) AND  DID=(SELECT DID FROM DEPARTMENT WHERE DNAME ='ELECTRICAL')

--2) Display name of student who is having second highest SPI.
SELECT name
FROM STUDENT_DATA
WHERE spi = (
    SELECT MAX(spi)
    FROM ACADEMIC
    WHERE spi < (
        SELECT MAX(spi)
        FROM ACADEMIC
    )
);


--3) Display city names whose students branch wise SPI is 9.2

SELECT CITY FROM STUDENT_DATA
WHERE NO= 
(SELECT RNO FROM ACADEMIC WHERE SPI = 9.2) 
AND 
DID IN (SELECT DID FROM DEPARTMENT WHERE DNAME IN (SELECT DNAME FROM DEPARTMENT GROUP BY DNAME))

--SET OPERATOR---

--PART-A----

CREATE TABLE COMPUTER(
	ROLLNO INT,
	NAME VARCHAR(20)
)
 
 INSERT INTO COMPUTER VALUES(101,'AJAY')
 INSERT INTO COMPUTER VALUES(109,'HARESH')
 INSERT INTO COMPUTER VALUES(115,'MANISH')

 SELECT * FROM COMPUTER


 CREATE TABLE ELECTRICAL(
	ROLLNO INT,
	NAME VARCHAR(20)
 )

 INSERT INTO ELECTRICAL VALUES(105,'AJAY'),
							  (107,'MAHESH'),
							  (115,'MANISH')
SELECT * FROM ELECTRICAL

--1) Display name of students who is either in Computer or in Electrical

SELECT NAME FROM COMPUTER
UNION
SELECT NAME FROM ELECTRICAL;

--2) Display name of students who is either in Computer or in Electrical including duplicate data.

SELECT NAME FROM COMPUTER
UNION ALL
SELECT NAME FROM ELECTRICAL

--3) Display name of students who is in both Computer and Electrical.
SELECT NAME FROM COMPUTER
INTERSECT
SELECT NAME FROM ELECTRICAL

--4) Display name of students who are in Computer but not in Electrical.

SELECT NAME FROM COMPUTER
EXCEPT
SELECT NAME FROM ELECTRICAL

--5) Display name of students who are in Electrical but not in Computer.

SELECT NAME FROM ELECTRICAL
EXCEPT
SELECT NAME FROM COMPUTER

--6) Display all the details of students who are either in Computer or in Electrical.

SELECT * FROM COMPUTER
UNION
SELECT * FROM ELECTRICAL

--7) Display all the details of students who are in both Computer and Electrical.

SELECT * FROM COMPUTER
INTERSECT
SELECT * FROM ELECTRICAL

--PART-B---

CREATE TABLE EMP_DATA(
	EID INT,
	Name VARCHAR(50)
);
INSERT INTO EMP_DATA(EID,Name) VALUES
(1,'Ajay'),
(9,'Haresh'),
(5,'Manish')
CREATE TABLE CUSTOMER(
	CID INT,
	Name VARCHAR(50) 
);
INSERT INTO CUSTOMER(CID,Name) VALUES
(5,'Ajay'),
(7,'Mahesh'),
(5,'Manish')

--1) Display name of persons who is either Employee or Customer.

SELECT NAME FROM EMP_DATA
UNION 
SELECT NAME FROM CUSTOMER

--2) Display name of persons who is either Employee or Customer including duplicate data.

SELECT NAME FROM EMP_DATA
UNION ALL
SELECT NAME FROM CUSTOMER

--3) Display name of persons who is both Employee as well as Customer.

SELECT NAME FROM EMP_DATA
INTERSECT
SELECT NAME FROM CUSTOMER

--4) Display name of persons who are Employee but not Customer.

SELECT NAME FROM EMP_DATA
EXCEPT
SELECT NAME FROM CUSTOMER

--5) Display name of persons who are Customer but not Employee.

SELECT NAME FROM CUSTOMER
EXCEPT
SELECT NAME FROM EMP_DATA

--PART-C

--1) Perform all the queries of Part-B but display ID and Name columns instead of Name only.

SELECT * FROM EMP_DATA
UNION 
SELECT * FROM CUSTOMER

SELECT * FROM EMP_DATA
UNION ALL
SELECT * FROM CUSTOMER

SELECT * FROM EMP_DATA
INTERSECT
SELECT * FROM CUSTOMER

SELECT * FROM EMP_DATA
EXCEPT
SELECT * FROM CUSTOMER

SELECT * FROM CUSTOMER
EXCEPT
SELECT * FROM EMP_DATA












































