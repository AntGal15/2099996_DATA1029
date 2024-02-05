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
