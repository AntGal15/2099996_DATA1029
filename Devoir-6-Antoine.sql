use library;
-- 1.Noms complets des employés et de leur employeur
select emp.fname,emp.lname, p.pub_name
from employees emp
join publishers as p where emp.pub_id = p.pub_id; 