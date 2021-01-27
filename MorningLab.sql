#1
-- Get all pairs of actors that worked together.

select f0.film_id,  f1.actor_id, f0.actor_id from film_actor as f0
join film_actor as f1
on f0.film_id = f1.film_id
and f0.actor_id <> f1.actor_id
group by f0.film_id;

#2
-- Get all pairs of customers that have rented the same film more than 3 times.
-- mayshit

select r0.inventory_id, r0.customer_id, r1.customer_id from rental as r0
join rental as r1
on  r0.customer_id <> r1.customer_id
and r0.inventory_id = r1.inventory_id
group by r0.inventory_id
having count(r0.customer_id) > 3 or count(r1.customer_id) > 3;

-- sara

SELECT r1.inventory_id, r1.customer_id, count(distinct r1.customer_id) as times_rented, r2.customer_id, count(distinct r2.customer_id) as times_rented2
FROM rental r1
JOIN rental r2
ON r1.inventory_id = r2.inventory_id and r1.customer_id <> r2.customer_id
group by r1.inventory_id
having times_rented >= 3 AND times_rented2 >= 3;

#3
-- Get all possible pairs of actors and films.
/*select f0.film_id, f0.actor_id, f1.actor_id from film_actor as f0
cross join select distinct film_id from as f1;*/

DROP TABLE IF EXISTS sakila.distinct_actor;
CREATE TEMPORARY TABLE sakila.distinct_actor
SELECT DISTINCT actor_id FROM sakila.film_actor;

DROP TABLE IF EXISTS sakila.distinct_film;
CREATE TEMPORARY TABLE sakila.distinct_film
SELECT DISTINCT film_id FROM sakila.film_actor;

SELECT concat(a.first_name, " ", a.last_name) as name, sub1.actor_id, sub2.film_id
FROM sakila.distinct_actor as sub1
	CROSS JOIN sakila.distinct_film as sub2
    JOIN sakil

