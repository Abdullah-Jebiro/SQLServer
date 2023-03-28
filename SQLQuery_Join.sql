
SELECT distinct e.FirstName,o.CustomerID  FROM [Employees] AS [e]
LEFT JOIN [Orders] AS [o] ON [e].[EmployeeID] = [o].[EmployeeID]
ORDER BY e.FirstName ,o.CustomerID


 Select * 
 From Categories c Full Join Products p
 on c.CategoryID=p.CategoryID
 Where p.CategoryID is Null

Select distinct e.FirstName , c.City From Employees e
Inner Join Orders o
on e.EmployeeID=o.EmployeeID Inner Join Customers c
on o.CustomerID = c.CustomerID
where o.Freight>720


SELECT DISTINCT [e].[FirstName] FROM [Employees] AS [e]
WHERE EXISTS (SELECT 1FROM [Orders] AS [o]
WHERE [e].[EmployeeID] = [o].[EmployeeID] AND [o].[Freight] > 720.0)

   

Select e.FirstName , Count(c.CustomerID)  as Count From Employees e
Inner Join Orders o
on e.EmployeeID=o.EmployeeID Inner Join Customers c
on o.CustomerID = c.CustomerID
where o.Freight>420
group by e.FirstName

Select p.* , c.CategoryName 
From Products p Inner Join  Categories c 
On p.CategoryID = c.CategoryID


Select c.CategoryName , COUNT(*) As COUNT
From Products p Inner Join  Categories c 
On p.CategoryID = c.CategoryID
Group By c.CategoryName  
Having COUNT(*)>10
Order By COUNT Desc


Select c.CategoryName , COUNT(p.ProductID) As COUNT
From Categories c  Left Join   Products p
On p.CategoryID = c.CategoryID
Group By c.CategoryName  
Order By COUNT Desc


Select p.ProductID , c.CategoryName
From Categories c  Full Join   Products p
On p.CategoryID = c.CategoryID
Where p.CategoryID is Null



Select c.ContactName , COUNT(*) As COUNT , SUM(od.UnitPrice) AS SUM
From Customers c Inner Join  Orders o On c.CustomerID = o.CustomerID
Inner Join [Order Details] od On od.OrderID = o.OrderID
Group By c.ContactName  
Having COUNT(*)>10
Order By COUNT Desc


Select * from
Products,Categories
where Products.CategoryID=Categories.CategoryID
or Products.CategoryID is null
order by ProductID


 Select * 
 From Categories c Left Join Products p
 on c.CategoryID=p.CategoryID

  
   
    
