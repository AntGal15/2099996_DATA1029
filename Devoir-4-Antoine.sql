-- Devoir 4 DATA1029

-- exercice 1
select au_id, au_fname, au_lname
from authors
where au_id not in (
    select au_id
    from titleauthor
    inner join titles on titleauthor.title_id = titles.title_id
    where pub_id = 1
);

-- exercice 2
select distinct a.au_id, a.au_fname, a.au_lname
from authors a
join titleauthor ta on a.au_id = ta.au_id
join titles t on ta.title_id = t.title_id
join publishers p on t.pub_id = p.pub_id
where p.pub_name = 'Eyrolles';