SELECT DISTINCT s.month
FROM product p INNER JOIN sales s ON p.pname = s.pname
INNER JOIN company c ON p.manufacturer = c.cname
WHERE c.country = 'Japan';
