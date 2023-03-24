

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Select e.FirstName+' '+ e.LastName AS Employee  , SUM(od.UnitPrice * od.Quantity) As Total , COUNT(od.ProductID) As CountProduct, SUM(od.Quantity) As Quantity
From Orders o Inner Join [Order Details] od
On o.OrderID = od.OrderID
Inner Join Employees e
On e.EmployeeID = o.EmployeeID
Group by e.FirstName+' '+ e.LastName
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Select c.CompanyName , c.City , temp.CountOrder, temp.CountProduct , temp.Quantity , temp.Total  From Customers c 
Inner Join
(Select  o.CustomerID, SUM(od.UnitPrice * od.Quantity) As Total ,
(Select Count(*) as Count From  Orders Where CustomerID = o.CustomerID) As CountOrder , 
COUNT(od.ProductID) As CountProduct, SUM(od.Quantity) As Quantity
From Orders o Inner Join [Order Details] od
On o.OrderID = od.OrderID
Group by o.CustomerID ) As temp
On c.CustomerID =temp.CustomerID
Order By Total Desc
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



Select e.FirstName ,
(CONVERT(Float,e.Salary)/(Select MAX(Salary) From Employees)*100) 
From Employees e


Select e.FirstName ,
(Select CONVERT(Float,e.Salary)/MAX(Salary) From Employees)
From Employees e


Select e.FirstName From Employees e
Where e.Country in( Select c.Country From Customers c)

Select p.ProductName From Products p
Where exists (
	Select od.ProductID From [Order Details] od 
	Where od.UnitPrice>40 
	and od.ProductID = p.ProductID
	)

Select  p.ProductName From Products p Inner Join [Order Details] od
on p.ProductID = od.ProductID
and od.UnitPrice>40

Select  o.CustomerID, SUM(od.UnitPrice * od.Quantity) As Total , COUNT(od.ProductID) As CountProduct, SUM(od.Quantity) As Quantity
From Orders o Inner Join [Order Details] od
On o.OrderID = od.OrderID
Group by o.CustomerID

---Count Order   ??????????????????????????????????????????

Select  CustomerID , Count(*) as Count
From  Orders 
Group by CustomerID
Order By Count Desc


-----------------------------
Select  o.CustomerID, SUM(od.UnitPrice * od.Quantity) As Total ,
(Select Count(*) as Count From  Orders Where CustomerID = o.CustomerID) As CountOrder , 
COUNT(od.ProductID) As CountProduct, SUM(od.Quantity) As Quantity
From Orders o Inner Join [Order Details] od
On o.OrderID = od.OrderID
Group by o.CustomerID
Order By CountOrder Desc


Select e.FirstName+' '+ e.LastName AS Employee  , SUM(od.UnitPrice * od.Quantity) As Total , COUNT(od.ProductID) As CountProduct, SUM(od.Quantity) As Quantity
From Orders o Inner Join [Order Details] od
On o.OrderID = od.OrderID
Inner Join Employees e
On e.EmployeeID = o.EmployeeID
Group by e.FirstName+' '+ e.LastName

Select SUM(od.UnitPrice * od.Quantity) From  [Order Details] od

Select SUM(Temp.Total ) From (

Select e.FirstName+' '+ e.LastName AS Employee  , SUM(od.UnitPrice * od.Quantity) As Total , COUNT(od.ProductID) As CountProduct, SUM(od.Quantity) As Quantity
From Orders o Inner Join [Order Details] od
On o.OrderID = od.OrderID
Inner Join Employees e
On e.EmployeeID = o.EmployeeID
Group by e.FirstName+' '+ e.LastName 

) as Temp



Select  c.City , COUNT(*) as COUNT
From Orders o Inner Join Customers c
On o.CustomerID = c.CustomerID
Group by c.City
Order By COUNT Desc


 





