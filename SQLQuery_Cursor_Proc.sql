Alter proc add10Tocustumars
as 
declare @Id nchar(5)
declare CursorCustumars Cursor For(Select CustomerID From Customers)
declare @Count int = (Select Count(*) From Customers)
Begin
Open CursorCustumars
Fetch Next  From  CursorCustumars Into @Id
While @Count>0
	Begin
    insert into CustumarsM values(@Id,10)
	set @Count=@Count-1
	Fetch Next  From  CursorCustumars Into @Id
	End
Close CursorCustumars
Deallocate CursorCustumars
Select * From CustumarsM
End

EXEC add10Tocustumars

 truncate table CustumarsM 

Select * into CustumarsM From(
 select CustomerID ,  10 as M From Customers c
 ) as Temp


 Drop table CustumarsM


 Alter proc CountEmployees
 @Salary int , @SumSalary int Out
 As
 Begin
 Set @SumSalary =(Select sum(c.Salary) From Employees c)
 Select Count(*) From Employees
 End

 Declare @SumSalary Int
 Declare @Salary Int =100;
 Exec CountEmployees @Salary, @SumSalary Out
 Select @SumSalary