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

-- exercice 5(permission seulement)
GRANT SELECT ON epharmacy.users TO 'pharma'@'localhost';
GRANT SELECT ON epharmacy.connection_history TO 'pharma'@'localhost';
GRANT SELECT ON epharmacy.roles TO 'pharma'@'localhost';
-- apres avoir executer les commandes
REVOKE SELECT ON epharmacy.* FROM 'pharma'@'localhost';

-- exercice 6(permission seulement)
GRANT SELECT ON epharmacy.suppliers TO 'pharma'@'localhost';
GRANT SELECT ON epharmacy.products TO 'pharma'@'localhost';
GRANT SELECT ON epharmacy.cart_product TO 'pharma'@'localhost';
-- apres avoir executer les commandes
REVOKE SELECT ON epharmacy.* FROM 'pharma'@'localhost';

-- exercice 7(permissions seulement)
GRANT SELECT ON epharmacy.warehouses TO 'pharma'@'localhost';
GRANT SELECT ON epharmacy.products TO 'pharma'@'localhost';
GRANT SELECT ON epharmacy.cart_product TO 'pharma'@'localhost';
-- apres avoir executer les commandes
REVOKE SELECT ON epharmacy.* FROM 'pharma'@'localhost';

-- exercice 8
GRANT UPDATE ON epharmacy.products TO 'pharma'@'localhost';
-- apres avoir executer les commandes
REVOKE UPDATE ON epharmacy.* FROM 'pharma'@'localhost';

-- exercice 9
GRANT ALTER ON epharmacy.users TO 'pharma'@'localhost';
-- apres avoir executer les commandes
REVOKE ALTER ON epharmacy.* FROM 'pharma'@'localhost';

-- exercice 10
GRANT UPDATE ON epharmacy.users TO 'pharma'@'localhost';
GRANT CREATE ON epharmacy.users TO 'pharma'@'localhost';
-- apres avoir executer les commandes
REVOKE UPDATE, CREATE ON epharmacy.* FROM 'pharma'@'localhost';

-- exercice 11
GRANT ALTER ON epharmacy.users TO 'pharma'@'localhost';
-- apres avoir executer les commandes
REVOKE ALTER ON epharmacy.* FROM 'pharma'@'localhost';

-- exercice 12
GRANT INSERT ON epharmacy.users TO 'pharma'@'localhost';
GRANT INSERT ON epharmacy.orders TO 'pharma'@'localhost';
GRANT INSERT ON epharmacy.invoices TO 'pharma'@'localhost';
GRANT INSERT ON epharmacy.invoice_elements TO 'pharma'@'localhost';
GRANT INSERT ON epharmacy.connection_history TO 'pharma'@'localhost';
GRANT INSERT ON epharmacy.carts TO 'pharma'@'localhost';
GRANT INSERT, SELECT ON epharmacy.cart_product TO 'pharma'@'localhost';
-- apres avoir executer les commandes
REVOKE INSERT, SELECT ON epharmacy.* FROM 'pharma'@'localhost';

