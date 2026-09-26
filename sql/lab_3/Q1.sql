SELECT p.pname, p.price, p.category, p.manufacturer, s.month, s.sold
FROM product p INNER JOIN sales s 
               ON p.pname = s.pname
ORDER BY p.pname;