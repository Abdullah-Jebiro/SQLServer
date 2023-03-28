Select temp.Status , COUNT(*) AS COUNT  From(
	Select e.FirstName, e.Salary ,Case 
		When e.Salary = (Select MAX(Salary)From Employees) Then 'MAX' 
		When e.Salary = (Select MIN(Salary)From Employees) Then 'MIN'
		When e.Salary Between (Select AVG(Salary)From Employees) and (Select MAX(Salary)From Employees) Then 'AVG To MAX'
		When e.Salary Between (Select MIN(Salary)From Employees) and (Select AVG(Salary)From Employees) Then 'MIN To AVG'
		Else ''
		End As Status
	From Employees e) As temp
Group by temp.Status


Select City,Gender , COUNT(*) AS Count,  SUM(Salary) As Salary From Employees 
Group by City, Gender

/*
var result = Employees
    .GroupBy(e => new { e.City, e.Gender })
    .Select(g => new {
        Count = g.Count(),
        Salary = g.Sum(e => e.Salary),
        City = g.Key.City,
        Gender = g.Key.Gender
    });
*/


SELECT COUNT(*) AS Count,SUM(Salary) AS Salary,city,Gender,
	CASE WHEN SUM(Salary)=(SELECT MAX(sum_Salary) FROM 
                          (SELECT SUM(Salary) AS sum_Salary 
                          FROM Employees 
                          GROUP BY city, Gender) AS temp)
						  THEN 1
						  ELSE 0
	END AS isMax
FROM  Employees 
GROUP BY city, Gender;


WITH EmployeeStats AS (
   SELECT COUNT(*) AS Count, 
          SUM(Salary) AS Salary,
          City,
          Gender
   FROM Employees 
   GROUP BY City, Gender
)
SELECT *, CAST(Salary AS REAL) / Count AS SalaryPerPerson
FROM EmployeeStats;



SELECT COUNT(*) AS Count, AVG(CONVERT(REAL,Salary ))  as SalaryPerPerson , SUM(Salary) AS Salary,
       City,
       Gender
FROM Employees 
GROUP BY City, Gender

SELECT count(*) , len(City) 
From Employees
GROUP BY   len(City) 
Having len(City) < 100;
