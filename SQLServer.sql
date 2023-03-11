
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
--  ..........

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
Select c.ContactName , COUNT(o.OrderID) as Count_Order , SUM(o.Freight) as Freight
From Customers c 
inner join Orders o
on c.CustomerID = o.CustomerID
group by ContactName


Select * From Employees;

Select Address+' '+ City+' '+Country as 'Total Address'  From Customers;

Select * From Customers;

Select EmployeeID, LastName+' '+FirstName as Name,Title, TitleOfCourtesy, BirthDate, HireDate,
Address+' '+City+''+Country as Address, Region,
PostalCode,HomePhone, Extension, Photo, Notes, ReportsTo, PhotoPath From Employees;


Select Distinct Country,City From Customers
Order by Country;
 

Select Top 10 percent *  From Employees;

Select Top 5 with ties *  From Employees
order by Extension;

Select * From Employees  
Where BirthDate between '1993-10-17 00:00:00.000' and '1994-03-05 00:00:00.000'  

select * from Customers
order by Country
offset 10 rows
fetch next 5 rows only


Select *  From Employees
order by EmployeeID Desc;

Select *  From Employees
order by FirstName Asc , len(LastName) Desc;




Select *  From Orders
order by Year(OrderDate) desc ,
Month(OrderDate) desc , ShipVia desc;


select min(Extension) , MAX(Extension)
From Employees;

Select *  From Employees 
where EmployeeID <> 4

Select *  From Employees 
where EmployeeID between  4  and 8


Select *  From Employees 
where EmployeeID in  ('USA','UK')


Select *  From Employees 
where EmployeeID like  'a%'


Select *  From Employees 
where FirstName like  '%a'

Select *  From Employees 
where FirstName like  '%pa'


Select *  From Employees 
where Employees.FirstName like  '_a%'

Select ContactName  From Customers 
where Customers.ContactName like  '_[abc]%'

Select ContactName  From Customers 
where Customers.ContactName like  '[^abc]%'


Select ContactName  From Customers 
where Customers.ContactName like  '[a-z]%'

Select *  From Employees 
where len(Employees.FirstName)>4



Select *  From Customers 
where Region is null


Select * , ISNULL(Region,'TI') as Region
From Customers 


select  EmployeeID,OrderDate  from Orders
order by  EmployeeID asc , OrderDate

select Sum(Convert(int,Extension)) as Extension ,City,TitleOfCourtesy
From Employees
group by City,TitleOfCourtesy


select count(*) , len(City) 
From Employees
group by  len(City) 
having len(City) < 100;


Select * from
Products,Categories
where Products.CategoryID=Categories.CategoryID
or Products.CategoryID is null
order by ProductID


Select ProductID,CategoryName , ProductName, SupplierID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued from
Products join Categories
on Products.CategoryID = Categories.CategoryID
order by CategoryName



Select CategoryName , COUNT(ProductName) as Count_Product
from Products join Categories
on Products.CategoryID = Categories.CategoryID
group by CategoryName

having COUNT(ProductName) > 5
order by COUNT(ProductName) Desc


Select c.ContactName , COUNT(o.OrderID) as Count_Order , SUM(o.Freight) as Freight
From Customers c 
inner join Orders o
on c.CustomerID = o.CustomerID
group by ContactName

Select * From Orders ,Customers 
where Orders.CustomerID=Customers.CustomerID and
ContactName = 'Alejandra Camino'


 Select * 
 From Categories c Left Join Products p
 on c.CategoryID=p.CategoryID

 Select * 
 From Categories c Full Join Products p
 on c.CategoryID=p.CategoryID
 Where p.CategoryID is Null


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
Union all
Select Employees.EmployeeID
from Employees Where EmployeeID <7


Select Employees.EmployeeID
from Employees Where EmployeeID >5
Union all
Select Employees.EmployeeID
from Employees Where EmployeeID <7


-------------------------------------
-------------------------------------

Select p.ProductName, c.CategoryName
From  Products p Left Join  Categories c
on c.CategoryID=p.CategoryID
Where p.CategoryID is Null
Union
Select  p.ProductName, c.CategoryName 
From  Products p   Right Join Categories c
on c.CategoryID=p.CategoryID
Where p.CategoryID is Null

-------------------------------------
-------------------------------------

Select Employees.EmployeeID
from Employees Where EmployeeID >5
intersect
Select Employees.EmployeeID
from Employees Where EmployeeID <7


Select Employees.EmployeeID
from Employees Where EmployeeID >5
except
Select Employees.EmployeeID
from Employees Where EmployeeID <7

select * , case
when EmployeeID >3 then 'no'
when EmployeeID <3 then 'yes'
end as 'status'
From Employees 

select * , case
when EmployeeID >3 then 'no'
else 'yes'
end as 'status'
From Employees 

select * ,iif(EmployeeID>=300,'no','yes')
From Employees 

Select Employees.FirstName,
Employees.Region,Employees.Country 
From Employees
order by(
Case When Region is null then Country
Else Region
end)


select count(*) , Customers.Country from Customers
group by Customers.Country

select COUNT(*) Country , ProductName from Products p inner join [Order Details] od
on p.ProductID = od.ProductID inner join Orders o
on o.OrderID = od.OrderID inner join Customers c 
on c.CustomerID = o.CustomerID
group by Country , ProductName

insert  into TempTable select * from (select COUNT(*) Country , ProductName from Products p inner join [Order Details] od
on p.ProductID = od.ProductID inner join Orders o
on o.OrderID = od.OrderID inner join Customers c 
on c.CustomerID = o.CustomerID
group by Country , ProductName) 








