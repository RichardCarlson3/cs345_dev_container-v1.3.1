SELECT p.manufacturer
FROM product p
GROUP BY p.manufacturer
HAVING COUNT(*) >= ALL(
    SELECT COUNT(*)
    FROM product p2
    GROUP BY p2.manufacturer
);
