SELECT e.name, COUNT(p.project)
FROM employees e LEFT JOIN projects p
ON e.empid = p.empid
GROUP BY e.name;