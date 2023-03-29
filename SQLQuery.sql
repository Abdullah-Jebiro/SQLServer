 select * From employees e 
 where exists(
 select city , count(*) From Employees
 where e.City=City
 Group by city
 having count(*)>1
 )