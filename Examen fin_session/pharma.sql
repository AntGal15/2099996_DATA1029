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
