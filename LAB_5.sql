---lab-5----

CREATE TABLE STUDENT1(
STUID INT,
FIRSTNAME VARCHAR(25),
LASTNAME VARCHAR(25),
WEBSITE VARCHAR(50),
CITY VARCHAR(25),
ADDRESS VARCHAR(100)
)

INSERT INTO STUDENT1 VALUES (1011,'KEYUR','PATEL','TECHONTHENET.COM','RAJKOT','A-303 ''Vasant Kunj'', Rajkot')
INSERT INTO STUDENT1 VALUES (1022,'HARDIK','SHAH','DIGMINECRAFT.COM','AHMEDABAD','"Ram Krupa", Raiya Road')
INSERT INTO STUDENT1 VALUES (1033,'KAJAL','TRIVEDI','BIGACTIVITIES.COM','BARODA','Raj bhavan plot, near garden')
INSERT INTO STUDENT1 VALUES (1044,'BHOOMI','GAJERA','CHECKYOURMATH.COM','AHMEDABAD','"Jig’s Home", Narol ')
INSERT INTO STUDENT1 VALUES (1055,'HARMIT','MITEL','@ME.DARSHAN.COM','RAJKOT','B-55, Raj Residency')
INSERT INTO STUDENT1 VALUES (1066,'ASHOK','JANI','NULL','BARODA','A502, Club House Building')

--PART-A----

--1) Display the name of students whose name starts with ‘k’.

SELECT FIRSTNAME FROM STUDENT1
WHERE FIRSTNAME LIKE 'K%'

--2) Display the name of students whose name consists of five characters.

SELECT FIRSTNAME FROM STUDENT1
WHERE FIRSTNAME LIKE '_____'

--3) Retrieve the first name & last name of students whose city name ends with a & contains six characters

SELECT FIRSTNAME,LASTNAME FROM STUDENT1
WHERE CITY LIKE '______A'

--4)  Display all the students whose last name ends with ‘tel’.

SELECT LASTNAME FROM STUDENT1
WHERE LASTNAME LIKE '%TEL'

--5) Display all the students whose first name starts with ‘ha’ & ends with‘t’

SELECT FIRSTNAME FROM STUDENT1
WHERE FIRSTNAME LIKE 'HA%T'

--6) Display all the students whose first name starts with ‘k’ and third character is ‘y’.

SELECT FIRSTNAME FROM STUDENT1
WHERE FIRSTNAME LIKE 'K_Y%'

--7) Display the name of students having no website and name consists of five characters

SELECT FIRSTNAME FROM STUDENT1
WHERE WEBSITE IS NULL AND FIRSTNAME LIKE '_____'

--8) Display all the students whose last name consist of ‘jer’. 

SELECT LASTNAME FROM STUDENT1
WHERE  LASTNAME LIKE '%JER%'

--9) Display all the students whose city name starts with either ‘r’ or ‘b’.

SELECT FIRSTNAME FROM STUDENT1
WHERE FIRSTNAME LIKE '[R,B]%'

--10) Display all the name students having websites.

SELECT FIRSTNAME FROM STUDENT1
WHERE WEBSITE IS NOT NULL

--11) Display all the students whose name starts from alphabet A to H

SELECT FIRSTNAME FROM STUDENT1
WHERE FIRSTNAME LIKE '[A-H]%'

--12) Display all the students whose name’s second character is vowel.
SELECT FIRSTNAME FROM STUDENT1
WHERE FIRSTNAME LIKE '_[A,E,I,O,U]%'

--13) Display the name of students having no website and name consists of minimum five characters.

SELECT FIRSTNAME FROM STUDENT1
WHERE WEBSITE IS NULL AND FIRSTNAME LIKE '_____'

--14) Display all the students whose last name starts with ‘Pat’. 

SELECT  LASTNAME FROM STUDENT1
WHERE LASTNAME LIKE 'PAT%'

--15) Display all the students whose city name does not starts with ‘b’.

SELECT FIRSTNAME FROM STUDENT1
WHERE CITY NOT LIKE 'B%'


---PART-B---

--1) Display all the students whose name starts from alphabet A or H.
SELECT FIRSTNAME FROM STUDENT1
WHERE FIRSTNAME LIKE '[A,H]%'

--2) Display all the students whose name’s second character is vowel and of and start with H.
SELECT FIRSTNAME FROM STUDENT1
WHERE FIRSTNAME LIKE 'H[A,E,I,O,U]%'

--3) Display all the students whose last name does not ends with ‘a’.

SELECT LASTNAME FROM STUDENT1
WHERE LASTNAME NOT  LIKE '%A'

--4) Display all the students whose first name starts with consonant.

SELECT FIRSTNAME FROM STUDENT1
WHERE FIRSTNAME NOT LIKE '[A,E,I,O,U]%'

--5) Display all the students whose website contains .net

SELECT FIRSTNAME FROM STUDENT1
WHERE FIRSTNAME LIKE '%.NET%'


--PART-C---

--1) Display all the students whose address consist of -.

SELECT FIRSTNAME FROM STUDENT1
WHERE FIRSTNAME LIKE '%-%'

--2) Display all the students whose address contains single quote or double quote.

SELECT FIRSTNAME FROM STUDENT1
WHERE FIRSTNAME LIKE '%''%''%' OR FIRSTNAME LIKE  '%"%"%'

--3) Display all the students whose website contains @.

SELECT FIRSTNAME FROM STUDENT1
WHERE FIRSTNAME LIKE '%@%'

--4) Display all the names those are either four or five characters.
SELECT FIRSTNAME FROM STUDENT1
WHERE FIRSTNAME LIKE '____' OR FIRSTNAME LIKE '_____'





