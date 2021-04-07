/*
•	For each customer last_name, list the film titles he rented and the corresponding language name.
•	Records should be sorted starting on the most expensive ones
•	Only show the films with a rental rate higher than 1 € */

SELECT c.last_name as customer_lastname, f.title as film_title , l.name as film_language
FROM customer c
	JOIN rental r ON c.customer_id = r.customer_id
	JOIN inventory i ON r.inventory_id = i.inventory_id
	JOIN film f ON i.film_id = f.film_id
	JOIN language l ON f.language_id = l.language_id
WHERE f.rental_rate > 1
ORDER BY f.rental_rate DESC;

