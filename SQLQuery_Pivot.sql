Select * From TempTable
Where Country='USA'

Select Country ,Chai,Chang From TempTable
Pivot(
Sum(COUNT) 
For ProductName in(Chai,Chang)
) as PivotTable
order by Chai Desc,Chang Desc


Select Country,Chai,Chang From TempTable
Pivot(
COUNT(COUNT) 
For ProductName in(Chai,Chang)
) as PivotTable