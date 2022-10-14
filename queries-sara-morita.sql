-- find the total rental amount paid for each film.
SELECT inventory.film_id, sum(payment.amount) as total_amount from
rental, payment, inventory where 
rental.rental_id  = payment.rental_id and 
rental.inventory_id = inventory.inventory_id 
group by inventory.film_id;



-- Create a view named total_rental_amount using the query from the previous step.
CREATE VIEW total_rental_amount AS
SELECT inventory.film_id, sum(payment.amount) as total_amount from
rental, payment, inventory where 
rental.rental_id  = payment.rental_id and 
rental.inventory_id = inventory.inventory_id 
group by inventory.film_id;


-- the total number of copies in inventory for each film. 
-- Your query should return the following columns: film_id total_copies
SELECT film_id, count(inventory_id) as total_copies from
 inventory
group by film_id;

-- Create a view named total_film_copies using the query from the previous step.
CREATE VIEW total_film_copies AS 
SELECT film_id, count(inventory_id) as total_copies from
 inventory
group by film_id;


-- find all films with a total rental amount greater than 200.00,
SELECT film.film_id, title, description, rental_duration, rental_rate, 
replacement_cost, rating, total_copies, total_amount  
from total_rental_amount, film, total_film_copies
where film.film_id  = total_rental_amount.film_id 
AND 
film.film_id  = total_film_copies.film_id 
AND 
total_rental_amount.total_amount > 200;
