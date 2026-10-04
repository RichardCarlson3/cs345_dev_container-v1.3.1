SELECT c.country
FROM company c 
JOIN product p ON c.cname = p.manufacturer
WHERE price = (SELECT min(price) FROM product);