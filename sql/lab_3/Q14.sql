SELECT category, AVG(price)
FROM product
WHERE price < 150
GROUP BY category
HAVING MAX(price) > 80;
