SELECT pname, SUM(sold) AS items_sold
FROM sales
GROUP BY pname
HAVING SUM(sold) > 3;
