-- Question 1
-- La liste des utilisateurs de l’application selon leur rôle. Le résultat doit avoir la structure suivante (15 points) :

select u.full_name, r.name 
from user u
join role r on r.id = u.role_id;

-- Question 2
--  Noms et quantités des produits achetés par Oumar Moussa. Le résultat doit avoir la structure suivante (20 points) :
select p.name, ol.quantity
from product p
join orderline ol on ol.product_id = p.id
join invoice i on i.order_id = ol.order_id
join user u on u.id = i.customer_id
where u.full_name = "Oumar Moussa";

-- Question 3
-- Quel sont les noms de produits dont le fournisseur est basé à Moncton ? (25 points)
select p.name
from product p
join supplier s on s.id = p.supplier_id
where s.city = "Moncton";

-- Questions bonus (20points)
-- 4. Qui a passé le plus de temps une fois connecté dans l’application (10 points) ?
select distinct u.full_name
from user u
join connection_history ch on ch.user_id = u.id
where ch.onsite_time = max(ch.onsite_time);

-- 5.Quel est le dernier utilisateur à se déconnecter ? (10 points)
