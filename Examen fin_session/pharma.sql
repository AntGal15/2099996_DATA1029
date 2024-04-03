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
