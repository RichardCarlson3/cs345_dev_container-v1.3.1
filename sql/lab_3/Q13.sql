SELECT month, AVG(sold)
FROM sales
GROUP BY month
HAVING MAX(sold) <= 2;

