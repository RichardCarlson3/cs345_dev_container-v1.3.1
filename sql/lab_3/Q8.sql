SELECT category, AVG(price)
FROM product
GROUP BY category;