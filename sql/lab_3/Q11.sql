SELECT month, AVG(sold) AS avg_sold
FROM sales
GROUP BY month;
