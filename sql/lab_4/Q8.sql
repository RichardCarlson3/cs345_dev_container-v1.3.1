SELECT pname, month
FROM sales s
WHERE sold = (
    SELECT max(sold) 
    FROM sales AS s2
    WHERE s.pname = s2.pname);