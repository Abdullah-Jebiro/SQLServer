select * , case
when EmployeeID >3 then 'no'
when EmployeeID <3 then 'yes'
end as 'status'
From Employees 

select * , case
when EmployeeID >3 then 'no'
else 'yes'
end as 'status'
From Employees 

Select e.FirstName , IIF(e.Salary>=3000,'Yes','No') From Employees e

Select COUNT(*) AS Count,SUM(Salary) AS Salary,city,Gender,
	CASE WHEN SUM(e.Salary)=(SELECT MAX(sum_Salary) FROM 
                          (SELECT SUM(Salary) AS sum_Salary 
                          FROM Employees 
                          GROUP BY city, Gender) AS temp)
						  THEN 1
						  ELSE 0
	END AS isMax
FROM  Employees e
GROUP BY city, Gender;



Select e.FirstName From Employees e
Order By(Case 
			When e.Region Is NULL Then e.Country
			Else e.Region
			End)


Select e.FirstName,
Case When
		e.Salary<(Select AVG(Salary) From Employees)
		Then 1 
		Else 0 
		End As Status
From Employees e


Select temp.Status , COUNT(*) As COUNT From (Select
	Case When
		e.Salary<(Select AVG(Salary) From Employees)
		Then 1 
		Else 0 
		End As Status
	From Employees e) As temp
Group by temp.Status
/*
using (var context = new NorthwndContext())
{
    var query = context.Employees.Select(e => new
    {
        e.FirstName,
        Status = e.Salary < context.Employees.Average(e => e.Salary)
        ? 0 : 1
    });
    var result = query.GroupBy(e => e.Status)
        .Select(e => new
        {
            Status = e.Key,
            Count = e.Count()
        });

    Write(result.ToList());
}
*/

Select e.FirstName, e.Salary ,Case 
		When e.Salary = (Select MAX(Salary)From Employees) Then 'MAX' 
		When e.Salary = (Select MIN(Salary)From Employees) Then 'MIN'
		When e.Salary Between (Select AVG(Salary)From Employees) and (Select MAX(Salary)From Employees) Then 'AVG To MAX'
		When e.Salary Between (Select MIN(Salary)From Employees) and (Select AVG(Salary)From Employees) Then 'MIN To AVG'
		Else ''
		End As Status
From Employees e



SELECT SUM(Salary) AS sum_Salary FROM Employees 
WHERE Gender = 'Female'
GROUP BY city, Gender

SELECT MAX(sum_Salary) FROM(SELECT SUM(Salary) AS sum_Salary FROM Employees 
WHERE Gender = 'Female'
GROUP BY city, Gender) AS temp

SELECT COUNT(*) AS Count, SUM(Salary) AS Salary, city, Gender,
    CASE WHEN SUM(Salary)=(SELECT MAX(sum_Salary) FROM
                          (SELECT SUM(Salary) AS sum_Salary 
                           FROM Employees 
                           WHERE Gender =e.Gender
                           GROUP BY city, Gender) AS temp)
        THEN 1
        ELSE 0
    END AS isMax
FROM Employees e
GROUP BY city, Gender;
/*
using (var context = new NorthwndContext())
{
    var result = context.Employees
    .GroupBy(e => new { e.City, e.Gender })
    .Select(g => new
    {
        Count = g.Count(),
        Salary = g.Sum(e => e.Salary),
        g.Key.City,
        g.Key.Gender,
        isMax = g.Sum(e => e.Salary) == context.Employees
        .Where(e => e.Gender == g.Key.Gender)
        .GroupBy(e => new { e.City, e.Gender })
        .Select(gg => gg.Sum(e => e.Salary))
        .Max() ? 1 : 0
    });
    //Write(result.ToList());
}
*/


























/*
var result = Employees
    .GroupBy(e => new { e.city, e.Gender })
    .Select(g => new {
        Count = g.Count(),
        Salary = g.Sum(e => e.Salary),
        city = g.Key.city,
        Gender = g.Key.Gender,
        isMax = g.Sum(e => e.Salary) == Employees
            .Where(e => e.Gender == g.Key.Gender)
            .GroupBy(e => new { e.city, e.Gender })
            .Select(g2 => g2.Sum(e => e.Salary))
            .Max() ? 1 : 0
    });
*/


