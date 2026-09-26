SELECT e.name, p.project
FROM employees e LEFT JOIN projects p
On e.empid = p.empid;