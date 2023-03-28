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

--STUFF(string, start, length, new_string)

declare @ListProduct nvarchar(max) = Stuff((
Select Distinct Top 10 ',['+t.ProductName+']' From TempTable t 
For Xml path('')),1,1,' ')

--Select @ListProduct
declare @Query nvarchar(max) =
'Select Country , '+@ListProduct +' From TempTable
Pivot(
SUM(COUNT) 
For ProductName in('+@ListProduct+')
)as PivotTable'

--Select @Query

Exec(@Query)