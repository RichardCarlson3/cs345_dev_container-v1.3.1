SELECT s.month, COUNT(DISTINCT(p.category))
FROM sales s 
JOIN product p ON s.pname = p.pname
GROUP BY s.month;
