
using Microsoft.EntityFrameworkCore;
using NORTHWND.Models;

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
    }).ToList();

    Write(result);

}
using (var context = new NorthwndContext())
{
    var EmployeesOrder= context.Employees.OrderBy(e=>e.Country).ToList();
    var topEmployees = EmployeesOrder
    .Take(5)
    .ToList();
    var maxCountry = topEmployees[topEmployees.Count - 1].Country;
    var topEmployees2 = EmployeesOrder.Skip(topEmployees.Count).TakeWhile(e => e.Country==maxCountry).ToList();
    topEmployees = topEmployees.Union(topEmployees2).ToList();
    Console.WriteLine( "");
    Write(topEmployees);
}
static void Write<T>(List<T> result)
{
    foreach (var item in result)
    {
        Console.WriteLine(item);
    }
}