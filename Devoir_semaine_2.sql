-- exercice 1
SELECT title, price FROM titles WHERE title LIKE '%computer%' ORDER BY title;

-- exercice 2
SELECT title, price FROM titles WHERE title LIKE '%computer%' AND title NOT LIKE '%computers%' ORDER BY title;