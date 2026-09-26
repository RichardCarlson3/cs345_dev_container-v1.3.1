SELECT p.pname, COALESCE(SUM(s.sold), 0)
FROM product p LEFT JOIN sales s
ON p.pname = s.pname
GROUP BY p.pname
ORDER BY COALESCE(SUM(s.sold), 0) DESC;
