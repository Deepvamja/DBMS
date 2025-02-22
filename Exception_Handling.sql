---LAB-7----

-- Create the Customers table 

CREATE TABLE Customers ( 
Customer_id INT PRIMARY KEY,                 
Customer_Name VARCHAR(250) NOT NULL,         
Email VARCHAR(50) UNIQUE    
);

-- Create the Orders table 

CREATE TABLE Orders ( 
Order_id INT PRIMARY KEY,                    
Customer_id INT,                             
Order_date DATE NOT NULL,                    
FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id)  
);

--Part – A---

--1. Handle Divide by Zero Error and Print message like: Error occurs that is - Divide by zero error. 

BEGIN TRY

    DECLARE @num1 INT = 5,
	        @num2 INT = 0, 
	        @result INT;

    SET @result = @num1 / @num2;

END TRY

BEGIN CATCH
    PRINT 'Error occurs that is - Divide by zero error.';
END CATCH;

--2. Try to convert string to integer and handle the error using try…catch block.

BEGIN TRY

    DECLARE @str VARCHAR(10) = 'DEEP';
    DECLARE @intValue INT;

    SET @intValue = CAST(@str AS INT);

END TRY

BEGIN CATCH
    PRINT 'Error while converting  string to integer.';
END CATCH;

--3. Create a procedure that prints the sum of two numbers: take both numbers as integer & handle 
--exception with all error functions if any one enters string value in numbers otherwise print result.

CREATE OR AlTER PROCEDURE PR_Calculation_SumWithErrorHandling

    @num1 NVARCHAR(50),
    @num2 NVARCHAR(50)
AS

BEGIN

    BEGIN TRY

        DECLARE @intNum1 INT = CAST(@num1 AS INT);
        DECLARE @intNum2 INT = CAST(@num2 AS INT);
        PRINT 'Sum : ' + CAST(@intNum1 + @intNum2 AS VARCHAR(50));

    END TRY

    BEGIN CATCH

        PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS VARCHAR(10));
        PRINT 'Error Severity: ' + CAST(ERROR_SEVERITY() AS VARCHAR(10));
        PRINT 'Error State: ' + CAST(ERROR_STATE() AS VARCHAR(10));
        PRINT 'Error Message: ' + ERROR_MESSAGE();

    END CATCH;

END;

EXEC PR_Calculation_SumWithErrorHandling '4','6'

--4. Handle a Primary Key Violation while inserting data into customers table and print the error details 
--such as the error message, error number, severity, and state. 

BEGIN TRY

        INSERT INTO Customers (Customer_id, Customer_Name, Email)

        VALUES (1, 'Deep Vamja', 'Deep@gmail.com'); -- Considering/Assuming  That ID 1 already exists
END TRY

    BEGIN CATCH
        PRINT 'Primary Key Violation Error Occurred';
        PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR(10));
        PRINT 'Error Severity: ' + CAST(ERROR_SEVERITY() AS NVARCHAR(10));
        PRINT 'Error State: ' + CAST(ERROR_STATE() AS NVARCHAR(10));
        PRINT 'Error Message: ' + ERROR_MESSAGE();
    END CATCH;

--5. Throw custom exception using stored procedure which accepts Customer_id as input & that throws 
--Error like no Customer_id is available in database. 

CREATE OR ALTER PROCEDURE PR_Customers_CheckCustomerId
    @CustomerId INT
AS
BEGIN

    IF NOT EXISTS (SELECT 1 FROM Customers WHERE Customer_id = @CustomerId)

    BEGIN
        THROW 50001, 'No Customer_id is available in database.', 1;
    END
    ELSE

    BEGIN
        PRINT 'Customer ID exists.';
    END
END;

EXEC PR_Customers_CheckCustomerId 3

--Part – B---

--6. Handle a Foreign Key Violation while inserting data into Orders table and print appropriate error 
--message. 

BEGIN TRY

    INSERT INTO Orders (Order_id, Customer_id, Order_date)
    VALUES (1, 999, GETDATE());

END TRY

BEGIN CATCH
    PRINT 'Foreign Key Violation Error Occurred: Invalid Customer_id.';
END CATCH;

--7. Throw custom exception that throws error if the data is invalid. 

CREATE OR ALTER PROCEDURE PR_DataValidation_CheckZeroValue
    @value INT
AS
BEGIN
    IF @value < 0
    BEGIN
        THROW 50002, 'Invalid data: Value cannot be Zero', 1;
    END
    ELSE

    BEGIN
        PRINT 'Data is valid.';
    END
END;

EXEC PR_DataValidation_CheckZeroValue -2

--8. Create a Procedure to Update Customer’s Email with Error Handling 

CREATE OR ALTER PROCEDURE PR_Customer_UpdateEmailWitHErrorHandling
    @CustomerId INT,
    @NewEmails VARCHAR(50)
AS
BEGIN
    BEGIN TRY
        UPDATE Customers
        SET Email = @NewEmails
        WHERE Customer_id = @CustomerId;
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred while updating email.';
        PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR(10));
		PRINT 'Error State: ' + CAST(ERROR_STATE() AS NVARCHAR(10));
		PRINT 'Error Severity: ' + CAST(ERROR_SEVERITY() AS NVARCHAR(10));
        PRINT 'Error Message: ' + ERROR_MESSAGE();
    END CATCH;
END;

EXEC PR_Customer_UpdateEmailWitHErrorHandling 2,'abc'

--Part – C--- 

--9. Create a procedure which prints the error message that “The Customer_id is already taken. Try another 
--one”. 

CREATE OR ALTER PROCEDURE PR_Customers_InsertDuplicate
    @CustomerId INT,
    @CustomerName VARCHAR(250),
    @Email VARCHAR(50)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Customers WHERE Customer_id = @CustomerId)
    BEGIN
        PRINT 'The Customer_id is already taken. Try another one.';
    END
    ELSE
    BEGIN
        INSERT INTO Customers (Customer_id, Customer_Name, Email)
        VALUES (@CustomerId, @CustomerName, @Email);

        PRINT 'Customer record inserted successfully.';
    END
END;

EXEC PR_Customers_InsertDuplicate 2,'deep','xyz'

--10. Handle Duplicate Email Insertion in Customers Table.

CREATE OR ALTER PROCEDURE PR_Customers_DuplicateEmail
    @CustomerId INT,
    @CustomerName VARCHAR(250),
    @Email VARCHAR(50)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Customers WHERE Email = @Email)
    BEGIN
        PRINT 'The Email is already Exists. Try another one.';
    END
    ELSE
    BEGIN
        INSERT INTO Customers (Customer_id, Customer_Name, Email)
        VALUES (@CustomerId, @CustomerName, @Email);

        PRINT 'Customer record inserted successfully.';
    END
END;

EXEC PR_Customers_DuplicateEmail 2,'deep','xyz'

