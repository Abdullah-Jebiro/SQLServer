/*
var EmployeesOrder = context.Employees.OrderBy(e => e.Country).ToList();
var topEmployees = EmployeesOrder.Take(5).ToList();
var maxCountry = topEmployees[topEmployees.Count - 1].Country;
var topEmployees2 = EmployeesOrder.Skip(topEmployees.Count).TakeWhile(e => e.Country == maxCountry).ToList();
topEmployees = topEmployees.Union(topEmployees2).ToList();
*/

select * from Employees e
order by e.FirstName
offset 2 rows
fetch next 4 row only

select  distinct  city from Customers   --distinct
select top 5 * from Employees
order by PostalCode

select top 25 percent * from Customers    --percent
order by PostalCode

select count(*) from Customers    --percent

select top 5 with ties * from Employees  --with ties 
order by Country
