/*Exercise 3: Select all columns if first_name starts by ‘B’;*/
SELECT * FROM actor
WHERE first_name LIKE 'B%';

/*Exercise 4: For each first_name, calculate the number of occurrences;*/
SELECT first_name, COUNT(first_name)
FROM actor 
GROUP by first_name;

/*Exercise 5: Create an alias for the countings column (eg.: howmany);*/
SELECT first_name, COUNT(first_name) AS HOWMANY
FROM actor 
GROUP by first_name;

/*Exercise 6: Reuse previous query and sort it DESC by the counting and ASC by first_name;*/
SELECT first_name, COUNT(first_name) AS HOWMANY
FROM actor 
GROUP BY first_name
ORDER BY HOWMANY DESC, first_name ASC;

/*Exercise 7: Select first 6 rows of table actor;*/
SELECT * FROM actor
LIMIT 6;

/*Exercise 8: Select 4 rows (from the 3rd until the 6th) from table actor;*/
SELECT * FROM ACTOR
OFFSET 2 LIMIT 4 ;

/*Exercise 9: Same as before, using fetch.;*/
SELECT * FROM ACTOR
OFFSET 2 ROWS 
FETCH FIRST 4 ROW ONLY;

/*Exercise 10:For each customer_id in payment table, show the total of the amounts paid;*/
SELECT customer_id, SUM(amount) 
FROM payment
GROUP BY customer_id;

/*Exercise 11: Same as before, filtering the customers that spent more than 200€.;*/
SELECT customer_id, SUM(amount) 
FROM payment
GROUP BY customer_id;
HAVING SUM(amount) > 200;

/*Exercise 12: Count the number of customers in table customer 599;*/
SELECT COUNT(*) FROM customer;

/*Exercise 13: Count the number of actors in table actors = 200;*/
SELECT COUNT(*) FROM actor;

/*Exercise 14: List the distinct first names of actors and customers in the same column = 647;*/
SELECT first_name FROM actor
UNION
SELECT first_name FROM customer;

/*Exercise 15: List the first names of actors and customers in the same column = 799;*/
SELECT first_name FROM actor
UNION ALL
SELECT first_name FROM customer;

/* NOTE: UNION removes duplicate records (where all columns in the results are the same), UNION ALL does not.*/

/*Exercise 16: List the common first names of actors and customers in the same column;*/
SELECT first_name FROM actor
INTERSECT
SELECT first_name FROM customer;

/*Exercise 17: List the first names of actors that don’t exist on customer table;*/
SELECT first_name FROM actor
EXCEPT
SELECT first_name FROM customer;

/*Exercise 18: Select customers from customer table whose customer_id is bigger than 9 and lower than 15;*/
SELECT * FROM customer
WHERE customer_id BETWEEN 10 AND 14;

/*Exercise 19: Select customers from customer table if their first name is Lisa or Marion;*/
SELECT * FROM customer
WHERE first_name IN ('Lisa','Marion');

/*Exercise 20: Select all records from staff which picture is null*/
SELECT * FROM staff
WHERE picture ISNULL;

/*Exercise 21: For each customer in customer table, show first and last names and the corresponding address, from address table;*/
SELECT first_name,last_name,address
FROM customer JOIN address on customer.address_id = address.address_id;

/* FORMA DE SIMPLIFICAR JOIN ANTERIOR*/
SELECT first_name,last_name,address
FROM customer as c JOIN address as a on c.address_id = a.address_id;