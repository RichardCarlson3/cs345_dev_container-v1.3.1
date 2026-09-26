SELECT p.pname, p.price, p.category, p.manufacturer, c.country
FROM product p INNER JOIN company c
               ON c.cname = p.manufacturer
WHERE p.price IS NOT NULL AND c.country IS NOT NULL
ORDER BY c.country;