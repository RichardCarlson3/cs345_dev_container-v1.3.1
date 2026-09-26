SELECT e1.name AS employee , e2.name AS managers
FROM employees e1 LEFT JOIN employees e2 
ON e1.managerid = e2.empid;