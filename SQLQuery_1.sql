


WITH EmployeeStats AS (
   SELECT COUNT(*) AS Count, 
          SUM(Extension) AS Extension,
          City,
          TitleOfCourtesy
   FROM Employees 
   GROUP BY City, TitleOfCourtesy
)
SELECT *, CAST(Extension AS REAL) / Count AS ExtensionPerPerson
FROM EmployeeStats;



SELECT COUNT(*) AS Count, AVG(CONVERT(REAL,Extension ))  as ExtensionPerPerson , SUM(Extension) AS Extension,
       City,
       TitleOfCourtesy
FROM Employees 
GROUP BY City, TitleOfCourtesy



SELECT
    COUNT(*) AS Count,
    SUM(Extension) AS Extension,
    city,
    TitleOfCourtesy,
    CASE 
		WHEN SUM(Extension) = (SELECT MAX(sum_extension) FROM 
                              (SELECT SUM(Extension) AS sum_extension 
                               FROM Employees 
                               GROUP BY city, TitleOfCourtesy) AS temp)
        THEN 1
        ELSE 0
    END AS isMax
FROM 
    Employees 
GROUP BY 
    city, TitleOfCourtesy;


SELECT COUNT(*) AS Count, SUM(Extension) AS Extension, city, TitleOfCourtesy,
    CASE
        WHEN SUM(Extension) = (SELECT MAX(sum_extension) FROM
                              (SELECT SUM(Extension) AS sum_extension 
                               FROM Employees 
                               WHERE TitleOfCourtesy = e.TitleOfCourtesy
                               GROUP BY city, TitleOfCourtesy) AS temp)
        THEN 1
        ELSE 0
    END AS isMax
FROM Employees e
GROUP BY city, TitleOfCourtesy;

/*var result = Employees.GroupBy(e => new { e.city, e.TitleOfCourtesy })
                      .Select(g => new 
                      {
                          Count = g.Count(),
                          Extension = g.Sum(x => x.Extension),
                          city = g.Key.city,
                          TitleOfCourtesy = g.Key.TitleOfCourtesy,
                          isMax = g.Sum(x => x.Extension) == Employees.Where(x => x.TitleOfCourtesy == g.Key.TitleOfCourtesy)
                                                                       .GroupBy(x => x.city)
                                                                       .Select(x => x.Sum(y => y.Extension))
                                                                       .Max() ? 1 : 0,
                          isMaxofTitleOfCourtesy = g.Sum(x => x.Extension) == Employees.Where(x => x.TitleOfCourtesy == g.Key.TitleOfCourtesy)
                                                                                    .Select(x => x.Extension)
                                                                                    .Sum(x => x) ? 1 : 0
                      });*/