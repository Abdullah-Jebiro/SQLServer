
-- 7
-- master
-- model
-- msdb
-- tempdb


-- DDL  (Data Definition Lanfuage)  Create Alter Drop Truncate
-- DML (Data Manipulaton Language) Insert Update Delete 
-- DQL (Data Query  Language) Select 
-- TCL (transaction Control Language) commit RollBack SavePoint
-- DCL (Data  Control Language ) Grant Revoke

create database midad;

use midad;

create table categories(
categoryId int Primary Key identity(1,1),  --not null and unique
categoryName  nvarchar(50) not null,
price int check(price > 0),
profileImage nvarchar(50) default 'default.png',
gender char(6) check(gender in ('male' , 'female') )
-- [RegularExpression("^(male|female)$", ErrorMessage = "Gender must be either 'male' or 'female'")]
-- public string Gender { get; set; }
)

create table Books(
Id int Primary Key identity(1,1),  --not null and unique
bookName  nvarchar(50) not null,
categoryId int,
age int,
-- foreign Key (categoryId) references categories(categoryId)
)

-- 8 
Alter table Books drop column age;
Alter table Books add descriptionBook nvarchar(250) , price int;
Alter table Books add Constraint categoryFK
Foreign Key(categoryId) 
references  categories (categoryId) on delete no action;

Select * From Books

ALTER TABLE Books ADD CONSTRAINT df_City DEFAULT 'Sandnes' FOR descriptionBook;
ALTER TABLE Persons ADD CHECK (Age>=18);
ALTER TABLE Books ADD CONSTRAINT constraint_name UNIQUE (column_name);
ALTER TABLE Employees alter column Salary  int  
EXEC sp_rename 'Employees.Extension', 'Salary', 'COLUMN';  
EXEC sp_rename 'Employees.TitleOfCourtesy', 'Gender', 'COLUMN';  

 -- drop table categories
-- not Null 
-- Unique
-- PRIMARY KEY
-- foreign KEY
-- CHECK 
-- DEFAULT
-- CREATE INDEX
-- IDENTITY

-- Constraint
-- references

-- on delete no action
-- on delete cascade
-- on delete set null
-- on delete set default

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(50),
  customer_email VARCHAR(50)
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  order_date DATE,
  order_total DECIMAL(10,2),
  customer_id INT,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    ON DELETE SET DEFAULT
); 
CREATE TABLE students (
  student_id INT PRIMARY KEY,
  student_name VARCHAR(50) NOT NULL,
  birthdate DATE,
  gender CHAR(1),
  class VARCHAR(50),
  grade CHAR(2)
);


truncate  table  customers  

INSERT INTO customers (customer_id, customer_name, customer_email)
VALUES (1, 'John Smith', 'john@example.com');

INSERT INTO students (student_id, student_name, class, grade)
VALUES
  (1, 'John Smith', 'History', 'A'),
  (2, 'Jane Doe', 'Math', 'B'),
  (3, 'Bob Johnson', 'English', 'C'),
  (4, 'Samantha Lee', 'Science', 'A');

UPDATE students SET grade = 'A', class = 'Science' WHERE student_id = 2;
UPDATE students SET student_name = 'S '+SUBSTRING(student_name,4, LEN(student_name));


use NORTHWND;


/*
var topEmployees = context.Employees
.OrderBy(e => e.Country)
.Take(5)
.ToList();
var maxCountry = topEmployees.Select(e => e.Country).Max();
var topEmployees2 = context.Employees.Where(e => e.Country== maxCountry).ToList();
topEmployees = topEmployees.Union(topEmployees2).ToList();
*/

--intersect
--Except



SELECT *
FROM (
  SELECT *
  FROM Employees
  WHERE Employees.City IS NULL
) subquery;

insert  into TempTable select * from (select COUNT(*) Country , ProductName from Products p inner join [Order Details] od
on p.ProductID = od.ProductID inner join Orders o
on o.OrderID = od.OrderID inner join Customers c 
on c.CustomerID = o.CustomerID
group by Country , ProductName) 


Select c.ContactName , COUNT(o.OrderID) as Count_Order , SUM(o.Freight) as Freight
From Customers c 
inner join Orders o
on c.CustomerID = o.CustomerID
group by ContactName

Select *  From Orders
order by Year(OrderDate) desc ,
Month(OrderDate) desc , ShipVia desc;


Select * , ISNULL(Region,'TI') as Region
From Customers 

select  EmployeeID,OrderDate  from Orders
order by  EmployeeID asc , OrderDate

select Sum(Convert(int,Salary)) as Salary ,City,Gender
From Employees
group by City,Gender

Select Employees.EmployeeID
from Employees
Union
Select Employees.EmployeeID
from Employees

Select Employees.EmployeeID
from Employees
Union all
Select Employees.EmployeeID
from Employees


Select Employees.EmployeeID
from Employees Where EmployeeID >5
Union all                         ---Union all
Select Employees.EmployeeID
from Employees Where EmployeeID <7

Select p.ProductName, c.CategoryName
From  Products p Left Join  Categories c
on c.CategoryID=p.CategoryID
Where p.CategoryID is Null
Union
Select  p.ProductName, c.CategoryName 
From  Products p Right Join Categories c
on c.CategoryID=p.CategoryID
Where p.CategoryID is Null


Select Employees.EmployeeID
from Employees Where EmployeeID >5
intersect                                --intersect
Select Employees.EmployeeID
from Employees Where EmployeeID <7

Select Employees.EmployeeID
from Employees Where EmployeeID >5
except                                   --except
Select Employees.EmployeeID
from Employees Where EmployeeID <7








