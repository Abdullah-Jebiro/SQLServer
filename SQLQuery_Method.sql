Select GetDate() as NowDate

Select YEAR(GetDate()) as NowDate

Select e.FirstName , YEAR(GetDate())-YEAR(e.HireDate) as Ex From Employees e
 


