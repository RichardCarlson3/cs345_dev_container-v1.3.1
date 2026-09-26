SELECT p.pname, p.price, p.category, p.manufacturer, c.country, s.sold
FROM product p INNER JOIN sales s ON p.pname = s.pname
INNER JOIN company c ON c.cname = manufacturer
WHERE s.month = 'June';