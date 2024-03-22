use library;
-- 1.Noms complets des employés et de leur employeur
select emp.fname,emp.lname, p.pub_name
from employees emp
join publishers as p where emp.pub_id = p.pub_id; 

-- 2.Noms complets des employés les plus rémunérés par employeurs
select CONCAT(e.fname, ' ', e.lname) as "Nom complet", p.pub_name, e.salary
from employees e
join publishers p on e.pub_id = p.pub_id
where e.salary = (
	select MAX(salary) 
	from employees 
	where pub_id = e.pub_id)
order by p.pub_name;