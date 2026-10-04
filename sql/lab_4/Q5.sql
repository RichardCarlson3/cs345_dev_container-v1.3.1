WITH months (name) AS ( 
  values 
  ('January'), 
  ('February'), 
  ('March'), 
  ('April'), 
  ('May'), 
  ('June'), 
  ('July'), 
  ('August'), 
  ('September'), 
  ('October'), 
  ('November'), 
  ('December')) 
SELECT m.name, COUNT(DISTINCT(p.category))
FROM months m
LEFT JOIN sales s ON m.name = s.month
LEFT JOIN product p ON s.pname = p.pname
GROUP BY m.name;
