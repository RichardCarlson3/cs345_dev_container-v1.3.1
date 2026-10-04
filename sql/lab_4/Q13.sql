SELECT d.fname, d.lname, COUNT(*)
FROM directors d 
JOIN movie_directors md ON d.id = md.did
JOIN genre g ON md.mid = g.mid
WHERE g.genre = 'Thriller'
GROUP BY d.id, d.fname, d.lname
HAVING COUNT(*) >= 30
ORDER BY COUNT(*) DESC;