SELECT category, AVG(price)
FROM product
GROUP BY category
HAVING AVG(price) > 100;