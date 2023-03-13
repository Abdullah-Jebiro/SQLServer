
SELECT COUNT(*) AS Count, 
          SUM(Salary) AS Salary,
          City,
          Gender
FROM Employees 
GROUP BY City, Gender


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


SELECT SUM(Salary) AS sum_Salary FROM Employees 
WHERE Gender = 'Female'
GROUP BY city, Gender

SELECT MAX(sum_Salary) FROM(SELECT SUM(Salary) AS sum_Salary 
 FROM Employees 
 WHERE Gender = 'Female'
 GROUP BY city, Gender) AS temp

SELECT COUNT(*) AS Count, SUM(Salary) AS Salary, city, Gender,
    CASE WHEN SUM(Salary)=(SELECT MAX(sum_Salary) FROM
                          (SELECT SUM(Salary) AS sum_Salary 
                           FROM Employees 
                           WHERE Gender =' e.Gender'
                           GROUP BY city, Gender) AS temp)
        THEN 1
        ELSE 0
    END AS isMax
FROM Employees e
GROUP BY city, Gender;

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


