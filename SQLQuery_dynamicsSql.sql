 declare @x int =9;
 Select * From Employees e
 Where e.EmployeeID=9
declare @CustomersCity nvarchar(max);
Set @CustomersCity = (Select c.City From Customers c  Where c.CustomerID='ANTON')
Select @CustomersCity as CustomersCity

declare @col  nvarchar(max) = 'Salary'
declare @table  nvarchar(max) = 'Employees'
declare @Sql  nvarchar(max) = 'Select '+@col+' From ' +@table
Exec (@Sql)

declare @MaxSalary Int = (Select Max(e.Salary ) From Employees e)
declare @Employee8Salary Int = (Select e.Salary From Employees e Where e.EmployeeID=8)
IF @MaxSalary = @Employee8Salary
Select 'Max Salary To Employee 8'
Else 
Begin
Select 'Salary  Employee 8 less Max Salary Is Salary' 
Select e.Salary From Employees e Where e.EmployeeID=8
End

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


declare @num int =0;
declare @sum int = 0;
While @num<=10
	Begin
		set @sum+=@num;
	    set @num+=1;
	End
Select @sum AS Sum


Begin Try
	Begin Transaction
	   Update Customers Set Region = 'BC' Where CustomerID='ALFKI'
	Delete From Customers  Where CustomerID='TOMSP'
	Commit
End Try
Begin Catch
	Rollback
	Select ERROR_LINE() , ERROR_MESSAGE() , ERROR_NUMBER()
End Catch

Select * From Customers
Where CustomerID='TOMSP' OR CustomerID='ALFKI'

Create Function getFullName(
@FisrtName nvarchar(max),
@LastName nvarchar(max))
Returns nvarchar(max)
Begin
Return @FisrtName+ ' ' + @LastName
End

Select dbo.getFullName(e.FirstName ,e.LastName) as FullName FRom Employees e

Create Function getListEmployees(@Salary int)
Returns Table
as
Return(Select *  From Employees e Where e.Salary>@Salary )

Select * From dbo.getListEmployees(500);


Create Function getListCustomers()
Returns @Table Table(First nvarchar(max) ,Last nvarchar(max))
Begin
	Insert Into @Table
	Select e.FirstName , E.LastName From Employees e
	Return
End

Select * From dbo.getListCustomers();