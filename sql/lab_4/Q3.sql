SELECT e1.name, COUNT(e2.name)
FROM employees e1 
LEFT JOIN employees e2 ON e1.empid = e2.managerid
GROUP BY e1.empid;
