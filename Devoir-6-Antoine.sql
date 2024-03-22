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

-- 3.Noms complets des employés de plus haut grade par employeurs.
select p.pub_name, CONCAT(e.fname, ' ', e.lname) as "Nom complet"
from employees e
join publishers p on e.pub_id = p.pub_id
where e.job_lvl = 'SEINIOR';

-- 4.Noms complets des employés ayant un salaire supérieur à celui de Norbert Zongo.
select CONCAT(fname, ' ', lname) AS "Nom complet", salary
from employees
where salary > (
	select salary 
	from employees 
    where fname = 'Norbert' and lname = 'Zongo');
    
-- 5.Noms complets des employés des éditeurs canadiens.
select CONCAT(e.fname, ' ', e.lname) as "Nom complet", p.pub_name
from employees e
join publishers p on e.pub_id = p.pub_id
where p.country = 'Canada';

-- 6.Noms complets des employés qui ont un manager.
select CONCAT(employees.fname, ' ', employees.lname) as "Nom complet", publishers.pub_name
from employees
join publishers on employees.pub_id = publishers.pub_id
where employees.job_lvl != 'SEINIOR'
order by publishers.pub_name;

-- 7.Noms complets des employés qui ont un salaire au-dessus de la moyenne de salaire chez leur employeur.
select CONCAT(fname, ' ', lname) as "Nom complet", salary
from employees
where salary > (
	select avg(salary) 
    from employees 
    where emp_id = employees.emp_id);
    
-- 8.Noms complets des employés qui ont le salaire minimum de leur grade
select distinct CONCAT(fname, ' ', lname) as "Nom complet"
from employees
where salary = (
    select MIN(salary)
    from employees
    where job_lvl = employees.job_lvl
);

-- 9.De quels types sont les livres les plus vendus?
select type, COUNT(*)
from titles
group by type
order by COUNT(*) desc
limit 1;

-- 10.Pour chaque boutique, les 2 livres les plus vendus et leurs prix.
select s.stor_id, t.title, t.price
from sales s
join titles t on s.title_id = t.title_id
where s.title_id in (
    select title_id
    from sales
    group by title_id
    order by SUM(qty) desc
);