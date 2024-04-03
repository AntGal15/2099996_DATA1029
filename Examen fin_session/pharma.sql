-- Examen fin session: Antoine Gallant et Francois savoie

-- exercice 1: voir le fichier Examen_Finale_DATA1029.drawio (fichier pour draw.io)

-- exercice 2
-- La ligne 12 désactive la vérification des contraintes de clé étrangère, permettant 
-- l'insertion de données sans contrôle de référence. La ligne 440  active la vérification des contraintes
-- de clé étrangère, garantissant l'intégrité référentielle des données. Elle doit être 
-- utilisée après des opérations de manipulation de données pour maintenir la cohérence de la base de données.

-- exercice 3 est dans le fichier root.sql

-- Exercice 4
SELECT CONCAT(u.firstname, ' ', u.lastname) AS "Nom complet", AVG(TIMESTAMPDIFF(MINUTE, ch.login_date, ch.logout_date)) AS "Duree moyene en minutes"
FROM users u
JOIN connection_history ch ON u.id = ch.user_id
GROUP BY u.id;

-- exercice 5
SELECT r.name AS "Nom du role"
FROM connection_history ch
JOIN users u ON ch.user_id = u.id
JOIN roles r ON u.role_id = r.id
GROUP BY r.name
ORDER BY SUM(TIME_TO_SEC(ch.onsite_time)) DESC
LIMIT 1;

-- exercice 6
SELECT s.name AS "Nom du supplier"
FROM suppliers s
JOIN products p ON s.id = p.supplier_id
JOIN (
    SELECT product_id, SUM(quantity) AS total_quantity
    FROM cart_product
    GROUP BY product_id
    ORDER BY total_quantity DESC
    LIMIT 3
) cp ON p.id = cp.product_id;

-- Exercice 7
SELECT w.name AS Entrepot, COALESCE(SUM(cp.quantity * p.price), 0) AS "Chiffre d'affaire"
FROM warehouses w
LEFT JOIN products p ON w.id = p.warehouse_id
LEFT JOIN cart_product cp ON p.id = cp.product_id
GROUP BY w.id;

-- exercice 8
UPDATE products
SET image = 'medoc.jpg'
WHERE description LIKE '%medical%' OR description LIKE '%medicinal%';

-- exercice 9
ALTER TABLE users
ADD COLUMN gender ENUM('MALE', 'FEMALE', 'OTHER') NOT NULL;

-- exercice 10
DELIMITER //
CREATE PROCEDURE spProfileImage()
BEGIN
    UPDATE users
    SET image = CASE
        WHEN designation = 'MALE' THEN 'male.jpg'
        WHEN designation = 'FEMALE' THEN 'female.jpg'
        ELSE 'other.jpg'
    END;
END//
DELIMITER ;

-- exercice 11
ALTER TABLE users
ADD CONSTRAINT unique_email UNIQUE (email);


-- exercice 12
start transaction;
INSERT INTO users (firstname, lastname, password,adress, city, province, country, postal_code,phone, email,role_id, gender,image) 
VALUES ('Alain', 'Foka', '',"72 McLaughlin Dr", "Moncton", "New-Brunswick", "Canada", "E1A2LP", "7154365275",'AlainFoka@email.com',"3", "MALE", "male.jpg");

INSERT INTO cart_product (cart_id, product_id, quantity, total, tax, quantity_remainder)
VALUES
(1, 1, 4, 40, 4, 4),
(1, 2, 5, 25, 2.5, 5),
(1, 3, 7, 70, 7, 7),
(2, 4, 5, 50, 5, 5),
(2, 5, 3, 30, 3, 3),
(2, 6, 4, 40, 4, 4),
(3, 7, 1, 10, 1, 1),
(3, 8, 2, 20, 2, 2),
(3, 9, 10, 100, 10, 10);

INSERT INTO orders (customer_id, order_date, total_amount, status, user_id, cart_id)
VALUES -- le id de mohammed est 2
(4, NOW(), (SELECT SUM(total) FROM cart_product WHERE cart_id = 1), 1, 2, 1),
(7, NOW(), (SELECT SUM(total) FROM cart_product WHERE cart_id = 2), 1, 2, 2),
(4, NOW(), (SELECT SUM(total) FROM cart_product WHERE cart_id = 3), 1, 2, 3);

INSERT INTO invoices (montant, tax, users_id)
VALUES
((SELECT SUM(total) FROM cart_product WHERE cart_id = 1), 0.1, 4),
((SELECT SUM(total) FROM cart_product WHERE cart_id = 2), 0.1, 7),
((SELECT SUM(total) FROM cart_product WHERE cart_id = 3), 0.1, 4);

INSERT INTO connection_history (login_date, logout_date, onsite_time, user_id)
VALUES
(NOW(), NOW(), '00:30:00', 4),
(NOW(), NOW(), '00:45:00', 7),
(NOW(), NOW(), '01:00:00', 4);

INSERT INTO carts (user_id, actif)
VALUES
(4, 1),
(7, 1),
(4, 1);

commit;


-- Exercice modification des donnees
UPDATE users SET
designation = 'Comptable',
adress = '415 Av. de l’Université',
province = 'NB',
postal_code = 'E1A3E9',
phone = '4065954526',
email = 'Ali@ccnb.ca'
WHERE firstname = 'Ali' AND lastname = 'Sani';

UPDATE users SET
designation = 'RH',
adress = '1750 Rue Crevier',
province = 'QC',
postal_code = 'H4L2X5',
phone = '5665954526',
email = 'Oumar@gmail.com'
WHERE firstname = 'Oumar' AND lastname = 'Moussa';

UPDATE users SET
designation = 'Consultant',
adress = '674 Van horne',
province = 'NS',
postal_code = 'B4V4V5',
phone = '7854665265',
email = 'Foka@ccnb.ca'
WHERE firstname = 'Dupont' AND lastname = 'Poupi';
