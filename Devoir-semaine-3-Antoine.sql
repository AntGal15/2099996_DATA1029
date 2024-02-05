-- Exercice 1
select a.au_fname as AuthorFirstName, a.au_lname as AuthorLastName, p.pub_name as PublisherName, a.city as City
from authors a
join publishers p on a.city = p.city;




