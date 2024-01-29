-- exercice 1
SELECT title, price FROM titles WHERE title LIKE '%computer%' ORDER BY title;

-- exercice 2
SELECT title, price FROM titles WHERE title LIKE '%computer%' AND title NOT LIKE '%computers%' ORDER BY title;

-- exercice 3
SELECT title, price FROM titles WHERE (title LIKE 'SU%' OR title LIKE 'BU%') ORDER BY title;

-- exercice 4
SELECT title, price FROM titles WHERE title_id NOT LIKE 'SU%' AND title_id NOT LIKE 'BU%';

-- exercice 5
SELECT title, price FROM titles WHERE title NOT LIKE 'S%' AND title NOT LIKE 'B%' AND title LIKE '_o%' ORDER BY title;

-- exercice 6
SELECT title, price FROM titles WHERE title NOT LIKE 'S%' AND title NOT LIKE 'B%' AND title LIKE '__f%';