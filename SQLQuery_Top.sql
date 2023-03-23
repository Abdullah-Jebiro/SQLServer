--var EmployeesOrder = context.Employees.OrderBy(e => e.Country).ToList();
--var topEmployees = EmployeesOrder.Take(5).ToList();
--var maxCountry = topEmployees[topEmployees.Count - 1].Country;
--var topEmployees2 = EmployeesOrder.Skip(topEmployees.Count).TakeWhile(e => e.Country == maxCountry).ToList();
--topEmployees = topEmployees.Union(topEmployees2).ToList();

Select Top 5 With Ties * From Employees  --with ties 
Order by Country