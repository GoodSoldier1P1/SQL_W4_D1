-- 1. How many actors are there with the last name 'Wahlberg'?
SELECT last_name, first_name
FROM actor
WHERE last_name = 'Wahlberg';

-- Reasoning: 
-- selecting the last and first name from actor and setting the search equal to Wahlberg. (Nick, Daryl)

-- 2. How many payments were made between $3.99 and $5.99?
SELECT amount
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

-- Reasoning: 
-- selcting the amount from payment and setting the search parameter for between 3.99 & 5.99

-- 3. What film does the store have the most of? (search in inventory)
SELECT film.film_id, title, COUNT(inventory.film_id) AS count  -- got tired of typing it so much so named it count
FROM inventory
INNER JOIN film
ON inventory.film_id = film.film_id
GROUP BY film.film_id
ORDER BY count DESC;

-- Reasoning: 
-- For this one I selcted two different tables, film and inventory. 
-- I used INNER JOIN to bring the film table in. I then joined the tables together on the film_id category with the ON
-- I then grouped it by film.film_id and sorted by what I named count (was too many letters to keep typing when I was getting errors.)
-- It then prints the film id's with the highest inventory count, as well as the title to the film.



-- 4. How many customers have the last name 'William'?
SELECT COUNT(last_name)
FROM customer
WHERE last_name = 'William';


-- Reasoning: 
--Selecting the count of last names. then matching to William. There are Williams / Williamson, but no Williams


-- 5. What store employee (get the id) sold the most rentals?
SELECT staff_id, COUNT(rental_id)
FROM payment
GROUP BY staff_id 
ORDER BY COUNT(rental_id) DESC;

-- Reasoning: 
-- Selecting the staff id and rental id. group it by the staff id but order it by the highest number of rental id's sold


-- 6. How many different district names are there?
SELECT COUNT(DISTINCT district)
FROM address;

-- Reasoning: 
-- selecting the district by the distinct counts. There are 603 total but only 378 distinct names.

-- 7. What film has the most actors in it? (use film_actor and get film_id)
SELECT film_id, COUNT(DISTINCT actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(DISTINCT actor_id) DESC;

-- Reasoning: 
-- select film id and distinct count of actor id's. group it by film id and order it by the distinct actor id's in descending order

-- 8. From store_id 1, how many customers have the last name ending with 'es'? (use customer table)
SELECT COUNT(DISTINCT last_name)
FROM customer
WHERE last_name LIKE '%es';

-- Reasoning: 
-- select last name from customer. Search for those ending in 'es', went back to SELECT to get the count of distinct occurrences


-- 9. How many payment amounts (4.99, 5.99, etc) had a number of rentals above 250 customers with ids between 380 and 430? (use group by and having > 250)
SELECT amount, COUNT(DISTINCT customer_id)
FROM payment
WHERE customer_id BETWEEN 380 and 430
GROUP BY amount
HAVING COUNT(amount) > 250
ORDER BY customer_id;

-- Reasoning: 
-- This is the furthest I got with it before class. Will work on it again after baby eats his bottle.

-- 10. Within the film table, how many rating categories are there? And what rating has the most movies total?
SELECT COUNT(DISTINCT rating)
FROM film;

SELECT film_id, MAX(rating)
FROM film
GROUP BY film_id
ORDER BY MAX(rating);

-- Reasoning
-- 5 different rating categories
-- G has the most ratings. I tried to drop this down to 5 lines, but was unable to do so. So I set the order to have the highest rating first.

