SELECT j_r.a, j_r.b, j_r.c, j_r.d
FROM (
    SELECT a, r2.b, c, d
    FROM r1 JOIN r2 ON r2.b = r1.b) AS j_r 
    LEFT JOIN r AS wrong_r ON wrong_r.a = j_r.a
AND wrong_r.b = j_r.b
AND wrong_r.c = j_r.c
AND wrong_r.d = j_r.d
WHERE wrong_r.a IS NULL;