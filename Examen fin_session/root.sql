-- Examen fin session: Antoine Gallant et Francois savoie

-- exercice 1: voir le fichier Examen_Finale_DATA1029.drawio (fichier pour draw.io)

-- exercice 2 repondu dans le fichier pharma.sql

-- exercice 3:
create user 'pharma'@'localhost' identified by '1234';

-- exercice 4(permission seulement)
GRANT SELECT ON epharmacy.users TO 'pharma'@'localhost';
GRANT SELECT ON epharmacy.connection_history TO 'pharma'@'localhost';
-- apres avoir executer les commandes
REVOKE SELECT ON epharmacy.* FROM 'pharma'@'localhost';