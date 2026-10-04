SELECT a.fname, a.lname, m.name
FROM actor a 
JOIN casts c ON a.id = c.pid
JOIN movie m ON c.mid = m.id
WHERE year = 1990
GROUP BY a.id, a.fname, a.lname, m.id, m.name
HAVING COUNT(DISTINCT c.role) = 5;