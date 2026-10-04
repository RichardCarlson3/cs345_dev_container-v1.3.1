SELECT c.cname, COUNT(p.pname)
FROM company c 
LEFT JOIN product p ON c.cname = p.manufacturer
GROUP BY c.cname;