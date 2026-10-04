SELECT e.name
FROM employees e, projects p
WHERE e.empid = p.empid
GROUP BY e.empid
HAVING COUNT(*) >= ALL(
    SELECT COUNT(*)
    FROM projects p2
    GROUP BY p2.empid
);
