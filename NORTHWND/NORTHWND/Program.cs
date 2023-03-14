
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
    });

}