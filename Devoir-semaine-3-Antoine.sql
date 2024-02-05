-- Exercice 1
select a.au_fname as AuthorFirstName, a.au_lname as AuthorLastName, p.pub_name as PublisherName, a.city as City
from authors a
join publishers p on a.city = p.city;

-- Exercice 2
select a.au_fname as AuthorFirstName, a.au_lname as AuthorLastName, p.pub_name as PublisherName, a.city as City
from authors a
left join publishers p on a.city = p.city;

-- Exercice 3
select a.au_fname as AuthorFirstName, a.au_lname as AuthorLastName, p.pub_name as PublisherName, p.city as City
from publishers p
left join authors a on p.city = a.city;

-- Exercice 4
select a.au_fname as AuthorFirstName, a.au_lname as AuthorLastName, p.pub_name as PublisherName, a.city as City
from authors a
left join publishers p on a.city = p.city
union
select a.au_fname, a.au_lname, p.pub_name, p.city
from publishers p
left join authors a on p.city = a.city;

-- Exercice 5
select job_lvl, count(*) as EmployeeCount
from employees
group by job_lvl;

-- Exercice 6
select e.fname as EmployeeFirstName, e.lname as EmployeeLastName, p.pub_name as PublisherName
from employees e
join publishers p on e.pub_id = p.pub_id;

-- Exercice 7
select p.pub_name as PublisherName, avg(e.salary) as AverageSalary
from employees e
join publishers p on e.pub_id = p.pub_id
group by p.pub_name;

-- Exercice 8 
select p.pub_name as PublisherName, count(*) as SeniorEmployeeCount
from employees e
join publishers p on e.pub_id = p.pub_id
where e.job_lvl = 'seinior'
group by p.pub_name;
