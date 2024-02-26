-- Question 1
-- La liste des utilisateurs de l’application selon leur rôle. Le résultat doit avoir la structure suivante (15 points) :

select u.full_name, r.name 
from user u
join role r on r.id = u.role_id;

-- Question 2
--  Noms et quantités des produits achetés par Oumar Moussa. Le résultat doit avoir la structure suivante (20points) :
select p.name, ol.quantity
from product p
join orderline ol on ol.product_id = p.id
join invoice i on i.order_id = ol.order_id
join user u on u.id = i.customer_id
where u.full_name = "Oumar Moussa";