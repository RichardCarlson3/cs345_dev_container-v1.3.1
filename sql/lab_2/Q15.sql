SELECT DISTINCT projname 
FROM project, employee, projassign 
WHERE project.projid = projassign.projid 
AND projassign.empid = employee.empid 
AND employee.empname = 'Alice'; 