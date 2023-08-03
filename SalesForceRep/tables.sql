drop table if exists Employee;
drop table if exists Territory;
drop table if exists Account;
drop table if exists "Order";
drop table if exists OrderLine;
drop table if exists Invoice;
drop table if exists InvoiceLine;
drop table if exists Call;
drop table if exists Visit;
drop table if exists Sample;
drop table if exists Product;
drop table if exists ExpenseCategory;
drop table if exists Expense;
drop table if exists GoalCategory;
drop table if exists Goal;
drop table if exists AchievementCategory;
drop table if exists Achievement;


CREATE TABLE Employee
(
  EmployeeID INT PRIMARY KEY,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  Title VARCHAR(50),
  Email VARCHAR(100) UNIQUE,
  Phone VARCHAR(20),
  HireDate DATE NOT NULL,
  TerminationDate DATE,
  CONSTRAINT Employee_EmployeeID_uindex UNIQUE (EmployeeID)
);

CREATE TABLE Territory (
  TerritoryID INT PRIMARY KEY,
  TerritoryName VARCHAR(50) NOT NULL,
  ManagerID INT,
  CONSTRAINT Territory_TerritoryID_uindex UNIQUE (TerritoryID),
  CONSTRAINT Territory_ManagerID_fk FOREIGN KEY (ManagerID) REFERENCES Employee (EmployeeID) ON DELETE SET NULL
);

CREATE TABLE Account (
  AccountID INT PRIMARY KEY,
  AccountName VARCHAR(100) NOT NULL,
  Address VARCHAR(200),
  City VARCHAR(50),
  State VARCHAR(50),
  Zip VARCHAR(20),
  Phone VARCHAR(20),
  Fax VARCHAR(20),
  Website VARCHAR(100),
  TerritoryID INT NOT NULL,
  CONSTRAINT Account_AccountID_uindex UNIQUE (AccountID),
  CONSTRAINT Account_TerritoryID_fk FOREIGN KEY (TerritoryID) REFERENCES Territory (TerritoryID) ON DELETE CASCADE
);

CREATE TABLE Product (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(100) NOT NULL,
  Price DECIMAL(10,2) NOT NULL,
  CONSTRAINT Product_ProductID_uindex UNIQUE (ProductID)
);

CREATE TABLE "Order"
(
  OrderID INT PRIMARY KEY,
  OrderDate DATE NOT NULL,
  AccountID INT NOT NULL,
  EmployeeID INT NOT NULL,
  CONSTRAINT Order_OrderID_uindex UNIQUE (OrderID),
  CONSTRAINT Order_AccountID_fk FOREIGN KEY (AccountID) REFERENCES Account (AccountID) ON DELETE CASCADE,
  CONSTRAINT Order_EmployeeID_fk FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID) ON DELETE CASCADE
);

CREATE TABLE OrderLine
(
  OrderID INT NOT NULL,
  ProductID INT NOT NULL,
  Quantity INT NOT NULL,
  CONSTRAINT OrderLine_pk PRIMARY KEY (OrderID, ProductID),
  CONSTRAINT OrderLine_OrderID_fk FOREIGN KEY (OrderID) REFERENCES "Order" (OrderID) ON DELETE CASCADE,
  CONSTRAINT OrderLine_ProductID_fk FOREIGN KEY (ProductID) REFERENCES Product (ProductID) ON DELETE CASCADE
);

CREATE TABLE Invoice (
  InvoiceID INT PRIMARY KEY,
  InvoiceDate DATE NOT NULL,
  AccountID INT NOT NULL,
  EmployeeID INT NOT NULL,
  CONSTRAINT Invoice_InvoiceID_uindex UNIQUE (InvoiceID),
  CONSTRAINT Invoice_AccountID_fk FOREIGN KEY (AccountID) REFERENCES Account (AccountID) ON DELETE CASCADE,
  CONSTRAINT Invoice_EmployeeID_fk FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID) ON DELETE CASCADE
);

CREATE TABLE InvoiceLine (
  InvoiceID INT NOT NULL,
  ProductID INT NOT NULL,
  Quantity INT NOT NULL,
  CONSTRAINT InvoiceLine_pk PRIMARY KEY (InvoiceID, ProductID),
  CONSTRAINT InvoiceLine_InvoiceID_fk FOREIGN KEY (InvoiceID) REFERENCES Invoice (InvoiceID) ON DELETE CASCADE,
  CONSTRAINT InvoiceLine_ProductID_fk FOREIGN KEY (ProductID) REFERENCES Product (ProductID) ON DELETE CASCADE
);

CREATE TABLE Call (
  CallID INT PRIMARY KEY,
  CallDateTime TIMESTAMP NOT NULL,
  AccountID INT NOT NULL,
  EmployeeID INT NOT NULL,
  Outcome VARCHAR(50),
  CONSTRAINT Call_CallID_uindex UNIQUE (CallID),
  CONSTRAINT Call_AccountID_fk FOREIGN KEY (AccountID) REFERENCES Account (AccountID) ON DELETE CASCADE,
  CONSTRAINT Call_EmployeeID_fk FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID) ON DELETE CASCADE
);

CREATE TABLE Visit (
  VisitID INT PRIMARY KEY,
  VisitDateTime TIMESTAMP NOT NULL,
  AccountID INT NOT NULL,
  EmployeeID INT NOT NULL,
  CONSTRAINT Visit_VisitID_uindex UNIQUE (VisitID),
  CONSTRAINT Visit_AccountID_fk FOREIGN KEY (AccountID) REFERENCES Account (AccountID) ON DELETE CASCADE,
  CONSTRAINT Visit_EmployeeID_fk FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID) ON DELETE CASCADE
);

CREATE TABLE Sample (
  SampleID INT PRIMARY KEY,
  SampleDate DATE NOT NULL,
  AccountID INT NOT NULL,
  EmployeeID INT NOT NULL,
  ProductID INT NOT NULL,
  Quantity INT NOT NULL,
  CONSTRAINT Sample_SampleID_uindex UNIQUE (SampleID),
  CONSTRAINT Sample_AccountID_fk FOREIGN KEY (AccountID) REFERENCES Account (AccountID) ON DELETE CASCADE,
  CONSTRAINT Sample_EmployeeID_fk FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID) ON DELETE CASCADE,
  CONSTRAINT Sample_ProductID_fk FOREIGN KEY (ProductID) REFERENCES Product (ProductID) ON DELETE CASCADE
);

CREATE TABLE ExpenseCategory (
  ExpenseCategoryID INT PRIMARY KEY,
  ExpenseCategoryName VARCHAR(50) NOT NULL,
  CONSTRAINT ExpenseCategory_ExpenseCategoryID_uindex UNIQUE (ExpenseCategoryID)
);

CREATE TABLE Expense (
  ExpenseID INT PRIMARY KEY,
  ExpenseDate DATE NOT NULL,
  EmployeeID INT NOT NULL,
  ExpenseCategoryID INT NOT NULL,
  Amount DECIMAL(10,2) NOT NULL,
  Description VARCHAR(200),
  CONSTRAINT Expense_ExpenseID_uindex UNIQUE (ExpenseID),
  CONSTRAINT Expense_EmployeeID_fk FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID) ON DELETE CASCADE,
  CONSTRAINT Expense_ExpenseCategoryID_fk FOREIGN KEY (ExpenseCategoryID) REFERENCES ExpenseCategory (ExpenseCategoryID) ON DELETE CASCADE
);

CREATE TABLE GoalCategory (
  GoalCategoryID INT PRIMARY KEY,
  GoalCategoryName VARCHAR(50) NOT NULL,
  CONSTRAINT GoalCategory_GoalCategoryID_uindex UNIQUE (GoalCategoryID)
);

CREATE TABLE Goal (
  GoalID INT PRIMARY KEY,
  Year INT NOT NULL,
  Quarter INT NOT NULL,
  EmployeeID INT NOT NULL,
  GoalCategoryID INT NOT NULL,
  Amount DECIMAL(10,2) NOT NULL,
  CONSTRAINT Goal_GoalID_uindex UNIQUE (GoalID),
  CONSTRAINT Goal_EmployeeID_fk FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID) ON DELETE CASCADE,
  CONSTRAINT Goal_GoalCategoryID_fk FOREIGN KEY (GoalCategoryID) REFERENCES GoalCategory (GoalCategoryID) ON DELETE CASCADE
);

CREATE TABLE AchievementCategory (
  AchievementCategoryID INT PRIMARY KEY,
  AchievementCategoryName VARCHAR(50) NOT NULL,
  CONSTRAINT AchievementCategory_AchievementCategoryID_uindex UNIQUE (AchievementCategoryID)
);

CREATE TABLE Achievement (
  AchievementID INT PRIMARY KEY,
  Year INT NOT NULL,
  Quarter INT NOT NULL,
  EmployeeID INT NOT NULL,
  AchievementCategoryID INT NOT NULL,
  Amount DECIMAL(10,2) NOT NULL,
  CONSTRAINT Achievement_AchievementID_uindex UNIQUE (AchievementID),
  CONSTRAINT Achievement_EmployeeID_fk FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID) ON DELETE CASCADE,
  CONSTRAINT Achievement_AchievementCategoryID_fk FOREIGN KEY (AchievementCategoryID) REFERENCES AchievementCategory (AchievementCategoryID) ON DELETE CASCADE
);
