INSERT INTO Employee(EmployeeID, FirstName, LastName, Title, Email, Phone, HireDate, TerminationDate)
VALUES
(1, 'John', 'Doe', 'Sales Manager', 'johndoe@company.com', '555-1234', '2020-01-01', NULL),
(2, 'Jane', 'Smith', 'Sales Representative', 'janesmith@company.com', '555-5678', '2020-01-01', NULL),
(3, 'Bob', 'Johnson', 'Sales Representative', 'bobjohnson@company.com', '555-9012', '2020-01-01', NULL),
(4, 'Mike', 'Williams', 'Account Manager', 'mikewilliams@company.com', '555-3456', '2020-01-01', NULL),
(5, 'Sarah', 'Brown', 'Account Manager', 'sarahbrown@company.com', '555-7890', '2020-01-01', NULL),
(6, 'Tom', 'Wilson', 'Accountant', 'tomwilson@company.com', '555-2345', '2020-01-01', NULL),
(7, 'Karen', 'Davis', 'Receptionist', 'karendavis@company.com', '555-6789', '2020-01-01', NULL);

INSERT INTO Account(AccountID, AccountName, Address, City, State, Zip, Phone, Fax, Website, TerritoryID)
VALUES
(1, 'Acme Inc', '123 Main St', 'Anytown', 'CA', '12345', '555-1111', '555-1112', 'www.acmeinc.com', 1),
(2, 'Widget Co', '456 Elm St', 'Othertown', 'CA', '67890', '555-2222', '555-2223', 'www.widgetco.com', 1),
(3, 'Gadget Corp', '789 Oak St', 'Somewhere', 'CA', '54321', '555-3333', '555-3334', 'www.gadgetcorp.com', 2),
(4, 'Thingamajig LLC', '123 Pine St', 'Nowhere', 'CA', '09876', '555-4444', '555-4445', 'www.thingamajigllc.com', 2),
(5, 'Whatchamacallit Enterprises', '456 Maple St', 'Anywhere', 'CA', '13579', '555-5555', '555-5556', 'www.whatchamacallitenterprises.com', 3),
(6, 'Doohickey Co', '789 Cedar St', 'Nopeville', 'CA', '86420', '555-6666', '555-6667', 'www.doohickeyco.com', 4),
(7, 'Sprocket Inc', '123 Oak St', 'Someplace', 'CA', '97531', '555-7777', '555-7778', 'www.sprocketinc.com',5);

INSERT INTO Territory(TerritoryID, TerritoryName, ManagerID)
VALUES
(1, 'Northwest', 1),
(2, 'Northeast', 2),
(3, 'Southwest', 3),
(4, 'Southeast', 4),
(5, 'West', 5),
(6, 'East',6),
(7, 'Central', 7);

INSERT INTO Product (ProductID, ProductName, Price)
VALUES (1, 'Advil', 100.00),
(2, 'Xanax', 200.00),
(3, 'Liptor', 300.00),
(4, 'Zoloft', 400.00),
(5, 'Prevner 13', 500.00),
(6, 'Chantix', 600.00),
(7, 'Lyrica', 700.00);

-- Insert data into ExpenseCategory table
INSERT INTO ExpenseCategory (ExpenseCategoryID, ExpenseCategoryName)
VALUES (1, 'Office Supplies'),
(2, 'Travel'),
(3, 'Meals and Entertainment');

-- Insert data into Expense table
INSERT INTO Expense (ExpenseID, ExpenseDate, EmployeeID, ExpenseCategoryID, Amount, Description)
VALUES (1, '2022-01-01', 1, 1, 50.00, 'Purchase of paper and pens'),
(2, '2022-01-02', 1, 2, 500.00, 'Business travel expenses'),
(3, '2022-01-03', 2, 1, 25.00, 'Purchase of paper and envelopes'),
(4, '2022-01-04', 2, 2, 750.00, 'Business travel expenses'),
(5, '2022-01-05', 3, 1, 75.00, 'Purchase of office supplies'),
(6, '2022-01-06', 3, 3, 100.00, 'Client dinner expenses'),
(7, '2022-01-07', 4, 2, 1000.00, 'Business travel expenses');

-- Insert data into GoalCategory table
INSERT INTO GoalCategory (GoalCategoryID, GoalCategoryName)
VALUES (1, 'Sales'),
(2, 'Customer Service'),
(3, 'Marketing');

-- Insert data into Goal table
INSERT INTO Goal (GoalID, Year, Quarter, EmployeeID, GoalCategoryID, Amount)
VALUES
  (1, 2023, 1, 1, 1, 1000.00),
  (2, 2023, 1, 2, 2, 500.00),
  (3, 2023, 1, 3, 1, 750.00),
  (4, 2023, 2, 4, 2, 1500.00),
  (5, 2023, 2, 5, 1, 2000.00),
  (6, 2023, 2, 6, 2, 1000.00),
  (7, 2023, 3, 7, 1, 500.00);

select * from employee e ;
select * from account a ;
select * from territory t ;
select * from product p ;
select * from expense e ;
select * from expensecategory e ;
select * from goal g ;
select * from goalcategory g ;

INSERT INTO "Order" (OrderID, OrderDate, AccountID, EmployeeID)
values 
(1, '2023-03-24', 1, 1),
(2, '2023-03-23', 2, 2),
(3, '2023-03-22', 3, 3),
(4, '2023-03-21', 4, 4),
(5, '2023-03-20', 5, 5),
(6, '2023-03-19', 6, 6),
(7, '2023-03-18', 7, 7);

INSERT INTO OrderLine (OrderID, ProductID, Quantity) 
VALUES (1, 1, 10),
(2, 2, 20),
(3, 3, 30),
(4, 4, 40),
(5, 5, 50),
(6, 6, 60),
(7, 7, 70);

INSERT INTO Invoice (InvoiceID, InvoiceDate, AccountID, EmployeeID) 
VALUES 
(1, '2023-03-24', 1, 1),
(2, '2023-03-23', 2, 2),
(3, '2023-03-22', 3, 3),
(4, '2023-03-21', 4, 4),
(5, '2023-03-20', 5, 5),
(6, '2023-03-19', 6, 6),
(7, '2023-03-18', 7, 7);

INSERT INTO InvoiceLine (InvoiceID, ProductID, Quantity) 
VALUES (1, 1, 10),
(2, 2, 20),
(3, 3, 30),
(4, 4, 40),
(5, 5, 50),
(6, 6, 60),
(7, 7, 70);

INSERT INTO Call (CallID, CallDateTime, AccountID, EmployeeID, Outcome) 
VALUES (1, '2023-03-23 09:00:00', 1, 1, 'Successful'),
(2, '2023-03-23 10:30:00', 2, 2, 'Successful'),
(3, '2023-03-23 11:45:00', 3, 3, 'No answer'),
(4, '2023-03-23 13:15:00', 4, 4, 'Busy'),
(5, '2023-03-23 14:30:00', 5, 5, 'Successful'),
(6, '2023-03-23 15:45:00', 6, 6, 'No answer'),
(7, '2023-03-23 16:30:00', 7, 7, 'Successful');

INSERT INTO Visit (VisitID, VisitDateTime, AccountID, EmployeeID) 
VALUES 
(1, '2023-03-23 09:00:00', 1, 1),
(2, '2023-03-23 10:30:00', 2, 2),
(3, '2023-03-23 11:45:00', 3, 3),
(4, '2023-03-23 13:15:00', 4, 4),
(5, '2023-03-23 14:30:00', 5, 5),
(6, '2023-03-23 15:45:00', 6, 6),
(7, '2023-03-23 16:30:00', 7, 7);


INSERT INTO Sample (SampleID, SampleDate, AccountID, EmployeeID, ProductID, Quantity) 
VALUES (1, '2023-03-22', 1, 1, 1, 10),
(2, '2023-03-22', 2, 2, 2, 20),
(3, '2023-03-22', 3, 3, 3, 15),
(4, '2023-03-22', 4, 4, 4, 5),
(5, '2023-03-22', 5, 5, 5, 30),
(6, '2023-03-22', 6, 6, 6, 25),
(7, '2023-03-22', 7, 7, 7, 8);

-- Insert data into AchievementCategory table
INSERT INTO AchievementCategory (AchievementCategoryID, AchievementCategoryName)
VALUES (1, 'Sales'), (2, 'Customer Service'), (3, 'Productivity'), (4, 'Leadership'), (5, 'Innovation'), (6, 'Teamwork'), (7, 'Safety');

-- Insert data into Achievement table
INSERT INTO Achievement (AchievementID, Year, Quarter, EmployeeID, AchievementCategoryID, Amount)
VALUES (1, 2021, 1, 1, 1, 2500.00),
       (2, 2021, 1, 2, 2, 1500.00),
       (3, 2021, 1, 3, 3, 2000.00),
       (4, 2021, 1, 4, 4, 1750.00),
       (5, 2021, 1, 5, 5, 3000.00),
       (6, 2021, 1, 6, 6, 1200.00),
       (7, 2021, 1, 7, 7, 1000.00);

INSERT INTO "Order" (OrderID, OrderDate, AccountID, EmployeeID)
VALUES
(8, '2022-01-08', 5, 2),
(9, '2022-01-09', 4, 1),
(10, '2022-01-10', 3, 1),
(11, '2022-01-11', 2, 2),
(12, '2022-01-12', 2, 3),
(13, '2022-01-13', 3, 4),
(14, '2022-01-14', 4, 4),
(15, '2022-01-15', 5, 1),
(16, '2022-02-01', 1, 1),
(17, '2022-03-02', 1, 2),
(18, '2022-04-03', 2, 2),
(19, '2022-02-04', 3, 3),
(20, '2022-12-05', 4, 4),
(21, '2022-10-06', 5, 4),
(22, '2022-11-07', 5, 3),
(23, '2022-09-08', 5, 2),
(24, '2022-08-09', 4, 1),
(25, '2022-07-10', 3, 1),
(26, '2022-06-11', 2, 2),
(27, '2022-01-12', 2, 3),
(28, '2022-12-13', 3, 4),
(29, '2022-03-14', 4, 4),
(30, '2022-02-15', 5, 1);

INSERT INTO OrderLine (OrderID, ProductID, Quantity) 
VALUES 
(8, 1, 25),
(9, 2, 55),
(10, 3, 110),
(11, 4, 60),
(12, 5, 100),
(13, 5, 20),
(14, 6, 150),
(15, 7, 170);


INSERT INTO Invoice (InvoiceID, InvoiceDate, AccountID, EmployeeID) 
VALUES 
(8, '2023-03-17', 1, 2),
(9, '2023-03-16', 2, 4),
(10, '2023-03-15', 3, 5),
(11, '2023-03-14', 4, 7),
(12, '2023-03-13', 5, 1),
(13, '2023-03-12', 6, 6),
(14, '2023-03-11', 7, 3),
(15, '2023-03-10', 5, 1);

INSERT INTO InvoiceLine (InvoiceID, ProductID, Quantity) 
VALUES 
(8, 1, 25),
(9, 5, 55),
(10, 6, 110),
(11, 2, 60),
(12, 3, 100),
(13, 3, 20),
(14, 7, 150),
(15, 4, 170);

INSERT INTO Call (CallID, CallDateTime, AccountID, EmployeeID, Outcome) 
VALUES 
(8, '2023-03-23 17:00:00', 2, 1, 'No answer'),
(9, '2023-03-23 17:30:00', 3, 2, 'Successful'),
(10, '2023-03-23 18:10:00',5, 4, 'Busy'),
(11, '2023-03-23 18:20:00', 7, 5, 'Busy'),
(12, '2023-03-23 18:50:00', 6, 2, 'Successful'),
(13, '2023-03-23 19:00:00', 4, 6, 'No answer'),
(14, '2023-03-23 19:10:00', 1, 7, 'Busy'),
(15, '2023-03-23 19:30:00', 2, 5, 'Successful');

INSERT INTO Visit (VisitID, VisitDateTime, AccountID, EmployeeID) 
VALUES 
(8, '2023-03-23 17:00:00', 1, 3),
(9, '2023-03-23 17:30:00', 2, 4),
(10, '2023-03-23 18:10:00', 4, 5),
(11, '2023-03-23 18:20:00', 6, 7),
(12, '2023-03-23 18:50:00', 5, 3),
(13, '2023-03-23 19:00:00', 7, 2),
(14, '2023-03-23 19:10:00', 3, 1),
(15, '2023-03-23 19:30:00', 1, 6);

INSERT INTO OrderLine (OrderID, ProductID, Quantity) 
VALUES 
(16,6,13),
(17,2,98),
(18,1,9),
(19,5,5),
(20,7,34),
(21,5,92),
(22,5,14),
(23,1,40),
(24,3,3),
(25,2,82),
(26,1,17),
(27,2,21),
(28,3,37),
(29,2,45),
(30,4,81);

INSERT INTO Achievement (AchievementID, Year, Quarter, EmployeeID, AchievementCategoryID, Amount)
VALUES
(8,2022,4,7,4,2902),
(9,2021,3,7,7,1853),
(10,2022,4,6,5,4711),
(11,2021,4,2,5,2805),
(12,2021,2,4,7,1793),
(13,2021,1,3,4,3942),
(14,2022,1,7,4,1979),
(15,2021,1,4,6,3182);

INSERT INTO Goal (GoalID, Year, Quarter, EmployeeID, GoalCategoryID, Amount)
VALUES
(8,2023,2,1,3,1200),
(9,2023,2,7,1,900),
(10,2023,4,6,2,600),
(11,2023,2,6,2,2300),
(12,2023,4,7,3,2100),
(13,2023,2,4,1,1200),
(14,2023,3,6,3,1800),
(15,2023,3,5,2,1400),
(16,2023,4,6,3,1900),
(17,2023,2,1,2,2400),
(18,2023,3,1,3,600),
(19,2023,2,7,3,1150),
(20,2023,2,7,3,2300),
(21,2023,4,5,3,2000),
(22,2023,4,1,2,1100),
(23,2023,3,6,1,2400),
(24,2023,2,6,1,1000),
(25,2023,4,2,1,900),
(26,2023,3,5,2,1800),
(27,2023,4,5,3,1200),
(28,2023,1,7,3,600),
(29,2023,4,7,1,1400),
(30,2023,2,6,2,1800);


INSERT INTO Expense (ExpenseID, ExpenseDate, EmployeeID, ExpenseCategoryID, Amount, Description)
VALUES 
(8, '2022-01-08', 4, 2, 120.00, 'Purchase of paper and pens'),
(9, '2022-01-09', 5, 1, 1050.00, 'Purchase of paper and envelopes'),
(10, '2022-01-10', 2, 2, 1300.00, 'Business travel expenses'),
(11, '2022-01-11', 6, 3, 100.00, 'Business travel expenses'),
(12, '2022-01-12', 7, 1, 300.00, 'Client Dinner expenses'),
(13, '2022-01-13', 3, 2, 3000.00, 'Purchase of office supplies'),
(14, '2022-01-14', 1, 2, 1100.00, 'Business travel expenses'),
(15, '2022-01-15', 1, 3, 1200.00, 'Business travel expenses');
------------------------------------------------------------
      
      
      
      
Select * from Employee;
Select * from Territory;
Select * from Account;
Select * from "Order"; 
Select * from OrderLine; 
Select * from Invoice; 
Select * from InvoiceLine; 
Select * from Call; 
Select * from Visit;
Select * from Sample;
Select * from Product;	
Select * from ExpenseCategory;
Select * from Expense;
Select * from GoalCategory;
Select * from Goal;
Select * from AchievementCategory;
Select * from Achievement;
