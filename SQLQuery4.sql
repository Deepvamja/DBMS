INSERT INTO [dbo].[User] (UserName, MobileNo, EmailID, CreationDate)
VALUES 
('Rahul Sharma', '9876543210', 'rahul.sharma@gmail.com', GETDATE()),
('Priya Agarwal', '9823456789', 'priya.agarwal@yahoo.com', GETDATE()),
('Arjun Verma', '9898123456', 'arjun.verma@outlook.com', GETDATE()),
('Neha Patel', '9876509876', 'neha.patel@rediffmail.com', GETDATE()),
('Vishal Kumar', '9812345678', 'vishal.kumar@indiatimes.com', GETDATE()),
('Sneha Nair', '9934567890', 'sneha.nair@hotmail.com', GETDATE()),
('Ananya Mishra', '9845098765', 'ananya.mishra@gmail.com', GETDATE()),
('Karan Singh', '9876123450', 'karan.singh@yahoo.com', GETDATE()),
('Ravi Chopra', '9812765432', 'ravi.chopra@outlook.com', GETDATE()),
('Meera Iyer', '9898989898', 'meera.iyer@rediffmail.com', GETDATE());




INSERT INTO [dbo].[Country] (CountryName, CountryCode, UserID, CreationDate)
VALUES 
('India', 'IN', 1, GETDATE()),
('United States', 'US', 2, GETDATE()),
('United Kingdom', 'UK', 3, GETDATE()),
('Canada', 'CA', 4, GETDATE()),
('Australia', 'AU', 5, GETDATE());




INSERT INTO [dbo].[State] (CountryID, StateName, StateCode, UserID, CreationDate)
VALUES 
(2, 'Gujarat', 'GJ', 1, GETDATE()),
(2, 'Maharashtra', 'MH', 2, GETDATE()),
(2, 'Karnataka', 'KA', 3, GETDATE()),
(2, 'Tamil Nadu', 'TN', 4, GETDATE()),
(2, 'Uttar Pradesh', 'UP', 5, GETDATE()),
(2, 'Rajasthan', 'RJ', 6, GETDATE()),
(2, 'West Bengal', 'WB', 7, GETDATE()),
(2, 'Madhya Pradesh', 'MP', 8, GETDATE()),
(2, 'Bihar', 'BR', 9, GETDATE()),
(2, 'Punjab', 'PB', 10, GETDATE());




INSERT INTO [dbo].[City] (StateID, CountryID, CityName, STDCode, PinCode, UserID, CreationDate)
VALUES 
(4, 2, 'Ahmedabad', '079', '380001', 1, GETDATE()),
(4, 2, 'Mumbai', '022', '400001', 2, GETDATE()),
(4, 2, 'Bengaluru', '080', '560001', 3, GETDATE()),
(4, 2, 'Chennai', '044', '600001', 4, GETDATE()),
(5, 2, 'Lucknow', '0522', '226001', 5, GETDATE()),
(6, 2, 'Jaipur', '0141', '302001', 6, GETDATE()),
(7, 2, 'Kolkata', '033', '700001', 7, GETDATE()),
(8, 2, 'Bhopal', '0755', '462001', 8, GETDATE()),
(9, 2, 'Patna', '0612', '800001', 9, GETDATE()),
(10,2, 'Chandigarh', '0172', '160001', 10, GETDATE());
