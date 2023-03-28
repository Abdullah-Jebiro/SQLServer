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
SELECT [c].[ContactName], [c].[City], (
    SELECT COUNT(*)
    FROM [Orders] AS [o1]
    WHERE [o1].[CustomerID] = [c].[CustomerID]) AS [CountOrder], COUNT(*) AS [CountProduct], COALESCE(SUM(CAST([o0].[Quantity] AS int)), 0) AS [Quantity], COALESCE(SUM([o0].[UnitPrice] * CAST([o0].[Quantity] AS money)), 0.0) AS [Total]
FROM [Customers] AS [c]
INNER JOIN [Orders] AS [o] ON [c].[CustomerID] = [o].[CustomerID]
INNER JOIN [Order Details] AS [o0] ON [o].[OrderID] = [o0].[OrderID]
GROUP BY [c].[ContactName], [c].[City], [c].[CustomerID]
ORDER BY COALESCE(SUM([o0].[UnitPrice] * CAST([o0].[Quantity] AS money)), 0.0) DESC
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Select e.FirstName ,
(CONVERT(Float,e.Salary)/(Select MAX(Salary) From Employees)*100) 
From Employees e


Select e.FirstName ,
(Select CONVERT(Float,e.Salary)/Sum(Salary) From Employees)*100
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


Select * Into TempTable From(
Select COUNT(*) As COUNT,p.ProductName , c.Country From Products p
Inner Join  [Order Details] od 
on p.ProductID = od.ProductID
Inner Join Orders o 
on o.OrderID = od.OrderID
Inner Join Customers c
on c.CustomerID=o.CustomerID
Group By p.ProductName,c.Country 
) as Temp


Insert Into TempTable Select * From(
Select COUNT(*) As COUNT,p.ProductName , c.Country From Products p
Inner Join  [Order Details] od 
on p.ProductID = od.ProductID
Inner Join Orders o 
on o.OrderID = od.OrderID
Inner Join Customers c
on c.CustomerID=o.CustomerID
Group By p.ProductName,c.Country 
) as Temp
 
Delete From TempTable
 
Select COUNT(*) From TempTable

Select  c.City , COUNT(*) as COUNT
From Orders o Inner Join Customers c
On o.CustomerID = c.CustomerID
Group by c.City
Order By COUNT Desc


 





