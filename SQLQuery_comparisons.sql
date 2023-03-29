select * from Orders
where OrderID between 10000 and 11000

select * from Customers
where Country in ('Mexico' , 'UK')


select * from Customers
where Country = 'Mexico' or  Country ='UK'


Select * From Employees  
Where BirthDate between '1993-10-17 00:00:00.000' and '1994-03-05 00:00:00.000'    

Select * From Employees 
where Employees.FirstName Like '%a%'

Select * From Employees 
where Employees.FirstName Like 'a%'

Select * From Employees 
where Employees.FirstName Like '%a'

Select * From Employees 
where Employees.FirstName Like '_____'

Select * From Employees 
where Employees.FirstName Like '%e_'

Select * From Employees 
where Employees.FirstName Like '%[abc]'

Select * From Employees 
where Employees.FirstName Like '%[^abc]'


Select * From Employees 
where Employees.FirstName Like '%[a-z]'
 
Select * From Employees 
where LEN(FirstName) = 5



