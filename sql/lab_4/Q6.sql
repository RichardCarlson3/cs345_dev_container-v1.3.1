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
SELECT m.name, COALESCE(SUM(s.sold * p.price), 0)
FROM months m
LEFT JOIN sales s ON m.name = s.month
LEFT JOIN product p ON s.pname = p.pname
GROUP BY m.name;
