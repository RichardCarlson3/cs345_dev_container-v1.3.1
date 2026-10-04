SELECT year, COUNT(*)
FROM movie
WHERE year >= 1890 AND year <= 1899
GROUP BY year;