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