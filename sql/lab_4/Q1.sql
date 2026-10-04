SELECT DISTINCT e.empid, e.name, e.phone
FROM employees e 
LEFT JOIN projects p ON e.empid = p.empid
WHERE p.project IS NULL;
