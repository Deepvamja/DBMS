---Trigger Extra Lab----

------------------- AFTER TRIGGER  ------------------

CREATE TABLE EMPLOYEEDETAILS
(
	EmployeeID Int Primary Key,
	EmployeeName Varchar(100) Not Null,
	ContactNo Varchar(100) Not Null,
	Department Varchar(100) Not Null,
	Salary Decimal(10,2) Not Null,
	JoiningDate DateTime Null
)

CREATE TABLE EmployeeLogs (
    LogID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT NOT NULL,
    EmployeeName VARCHAR(100) NOT NULL,
    ActionPerformed VARCHAR(100) NOT NULL,
    ActionDate DATETIME NOT NULL
);


--1)	Create a trigger that fires AFTER INSERT, UPDATE, and DELETE operations on the EmployeeDetails table to display the message "Employee record inserted", "Employee record updated", "Employee record deleted"

--INSERT---
CREATE TRIGGER TR_INSERT
ON EMPLOYEEDETAILS
AFTER INSERT
AS
BEGIN
  PRINT 'Employee record inserted'
END

--UPDATE---

CREATE TRIGGER TR_UPDATE
ON EMPLOYEEDETAILS
AFTER UPDATE
AS
BEGIN
  PRINT 'Employee record UPDATED'
END

---DELETE---

CREATE TRIGGER TR_DELETE
ON EMPLOYEEDETAILS
AFTER DELETE
AS
BEGIN
  PRINT 'Employee record DELETED'
END

--2)	Create a trigger that fires AFTER INSERT, UPDATE, and DELETE operations on the EmployeeDetails table to log all operations into the EmployeeLog table.

---INSERT---

CREATE TRIGGER tr_Employee_after_Insert
ON EmployeeLogs
After insert
as
begin
	Declare @EmpID int;
	Declare @EmpName varchar(100);

	select @EmpID = EmployeeID from inserted
	Select @EmpName = EmployeeName from inserted

	Insert into EmployeeLogs
	values(@EmpID, @EmpName, 'Insert', getdate())

end

---UPDATE--

CREATE TRIGGER tr_Employee_after_UPDATE
ON EmployeeLogs
After UPDATE
as
begin
	Declare @EmpID int;
	Declare @EmpName varchar(100);

	select @EmpID = EmployeeID from inserted
	Select @EmpName = EmployeeName from inserted

	Insert into EmployeeLogs
	values(@EmpID, @EmpName, 'UPDATE', getdate())

end

---DELETE----

CREATE TRIGGER tr_Employee_after_DELETE
ON EmployeeLogs
After DELETE
as
begin
	Declare @EmpID int;
	Declare @EmpName varchar(100);

	select @EmpID = EmployeeID from deleted
	Select @EmpName = EmployeeName from deleted

	Insert into EmployeeLogs
	values(@EmpID, @EmpName, 'DELETE', getdate())

end

--3)	Create a trigger that fires AFTER INSERT to automatically calculate the joining bonus (10% of the salary) for new employees and update a bonus column in the EmployeeDetails table.
CREATE OR ALTER TRIGGER tr_Employee_Bonus
On EmployeeDetails
After Insert
as
begin
	declare @empId int;
	select @empId= EmployeeID from inserted
	
	Update EmployeeDetails
	set Salary = Salary + Salary*0.1
	where EmployeeID = @empId
end

--4)	Create a trigger to ensure that the JoiningDate is automatically set to the current date if it is NULL during an INSERT operation.
CREATE TRIGGER TR_EMPLOYEE_JOINING
ON EMPLOYEEDETAILS
AFTER INSERT
AS
BEGIN
  declare @empId int;
	declare @JoiningDate datetime;
	select @empId= EmployeeID from inserted;
	select @JoiningDate = JoiningDate from inserted

	if @JoiningDate IS Null
		begin
			Update EMPLOYEEDETAILS
			set JoiningDate = getdate()
			where EmployeeID = @empId 
		end
END

--5)	Create a trigger that ensure that ContactNo is valid during insert and update (Like ContactNo length is 10)
CREATE TRIGGER TR_EMPDETAILS_CONTACT_INSERT
ON EMPLOYEEDETAILS
AFTER INSERT,UPDATE
AS 
BEGIN

     DECLARE @EmployeeID int;
	 DECLARE @ContactNo VARCHAR(200);


	 SELECT @EmployeeID = EMPLOYEEID FROM INSERTED
	 SELECT @ContactNo = ContactNO FROM INSERTED

	 IF len(@ContactNo)  < 10
	   print('invalid contact no')
end

--------- Instead of Trigger-------------

CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    MovieTitle VARCHAR(255) NOT NULL,
    ReleaseYear INT NOT NULL,
    Genre VARCHAR(100) NOT NULL,
    Rating DECIMAL(3, 1) NOT NULL,
    Duration INT NOT NULL
);

CREATE TABLE MoviesLog
(
	LogID INT PRIMARY KEY IDENTITY(1,1),
	MovieID INT NOT NULL,
	MovieTitle VARCHAR(255) NOT NULL,
	ActionPerformed VARCHAR(100) NOT NULL,
	ActionDate	DATETIME  NOT NULL
);

--1.	Create an INSTEAD OF trigger that fires on INSERT, UPDATE and DELETE operation on the Movies table. For that, log all operations performed on the Movies table into MoviesLog.

---INSERT---
Create or alter trigger tr_Insteadof_insert_Movie
on MoviesLog
instead of Insert
as
begin
	Declare @movieId int;
	Declare @title varchar(100);

	select @movieId = movieId from inserted
	Select @title = movietitle from inserted

	Insert into MoviesLog
	values(@movieId, @title, 'Insert', getdate())

end

--update---

Create or alter trigger tr_Insteadof_Update_Movie
on Movies
instead of Update
as
begin
	Declare @movieId int;
	Declare @title varchar(100);

	select @movieId = movieId from inserted
	Select @title = movietitle from inserted

	Insert into MoviesLog
	values(@movieId, @title, 'Update', getdate())

end

---DELETE----

Create or alter trigger tr_Insteadof_Delete_Movie
on Movies
instead of Delete
as
begin
	Declare @movieId int;
	Declare @title varchar(100);

	select @movieId = movieId from inserted
	Select @title = movietitle from inserted

	Insert into MoviesLog
	values(@movieId, @title, 'Delete', getdate())

end


--2.	Create a trigger that only allows to insert movies for which Rating is greater than 5.5 .

Create or alter trigger tr_Insteadof_insert_Movie_Rating
on Movies
instead of Insert
as
begin
	INSERT INTO MoviesLogs (MovieID, MovieTitle,  ReleaseYear,Genre, Rating,duration)
        SELECT MovieID, MovieTitle, ReleaseYear,Genre, Rating,duration
        FROM inserted
		where Rating>5.5;

end

--3.	Create trigger that prevent duplicate 'MovieTitle' of Movies table and log details of it in MoviesLog table.
Create or alter trigger tr_Insteadof_insert_Movie_duplicate
on Movies
instead of Insert
as
begin
	INSERT INTO Movies (MovieID, MovieTitle,  ReleaseYear,Genre, Rating,duration)
        SELECT MovieID, MovieTitle, ReleaseYear,Genre, Rating,duration
        FROM inserted
		where MovieTitle Not In (Select MovieTitle from inserted);

end

--4.	Create trigger that prevents to insert pre-release movies.

Create or alter trigger tr_Insteadof_insert_Movie_PreRelease
on Movies
instead of Insert
as
begin
	INSERT INTO Movies (MovieID, MovieTitle,  ReleaseYear,Genre, Rating,duration)
        SELECT MovieID, MovieTitle, ReleaseYear,Genre, Rating,duration
        FROM inserted
		where Year(ReleaseYear)>Year(GetDate());

end


--5.	Develop a trigger to ensure that the Duration of a movie cannot be updated to a value greater than 120 minutes (2 hours) to prevent unrealistic entries.

Create or alter trigger tr_Insteadof_insert_Movie_Duration
on Movies
instead of Insert
as
begin
	INSERT INTO Movies (MovieID, MovieTitle,  ReleaseYear,Genre, Rating,duration)
        SELECT MovieID, MovieTitle, ReleaseYear,Genre, Rating,duration
        FROM inserted
		where Duration>120;

end


 




