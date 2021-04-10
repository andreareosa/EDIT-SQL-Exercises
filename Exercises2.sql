/* DATABASE FUNDAMENTALS - AULA 3 */

/*Exercise 20: Identify the existing address_id’s on table address which have no customer associated. (Don’t use join!!);*/

SELECT address_id FROM address
EXCEPT
SELECT address_id FROM customer;

/*Exercise 21: List address_id, address, first_name for customers with address_id<=7 */

SELECT c.address_id, address, first_name
FROM customer c INNER JOIN address a on c.address_id = a.address_id
WHERE c.address_id <= 7
ORDER BY c.address_id;

/*Exercise 22: List address_id, address, first_name for customers with address_id<=7.
Must include also address_id’s without customers! USING LEFT JOIN*/

SELECT a.address_id, address, first_name
FROM address a LEFT JOIN customer c on c.address_id = a.address_id
WHERE a.address_id <= 7
ORDER BY a.address_id;

/*Exercise 23: List address_id, address, first_name for customers with address_id<=7.
Must include also address_id’s without customers! USING RIGHT JOIN*/

SELECT a.address_id, address, first_name
FROM customer c RIGHT JOIN address a on c.address_id = a.address_id
WHERE a.address_id <= 7
ORDER BY a.address_id;

/*Exercise 24: For each record having address2 as null, on address table, present
i.address2
ii.address3 as result of: using coalesce to replace null values by ‘Unknown’ on address2
iii.address
iv.last_char as result of, using case,
  a.if address’ last char is ‘e’, write E;
  b.if address’ last char is ‘d’, write D;
  c.if address’ last char is anything else, write X.
*/

SELECT address2, COALESCE(address2, 'Unknown') as address3, address,
CASE
	WHEN RIGHT(address,1) = 'e' THEN 'E'
	WHEN RIGHT(address,1) = 'd' THEN 'D'
	ELSE 'X'
END AS last_char
FROM address
WHERE address2 IS NULL;


/*Exercise 25: In which films (titles) did each actor performed?
Display first and last name in same column (eg.: 'Jared Ely');
Sort by actor full name
List only actors whose first name ends in 'm'*/

SELECT CONCAT(first_name, ' ', last_name) as actor, title
FROM actor a 
	JOIN film_actor fa on a.actor_id = fa.actor_id 
	JOIN film f on fa.film_id = f.film_id
WHERE RIGHT(first_name,1) = 'm'
ORDER BY actor;

SELECT first_name || ' ' || last_name as actor, title


/*Exercise 26: For each customer first_name in lower case, list the year of his last_update; */

SELECT LOWER(first_name) as customer_name,
EXTRACT(YEAR FROM last_update) as update_year
FROM customer;

/*Exercise 27: For each customer first_name, list store_id, active, store_id+active (eg.: 1+2), and store_idactive (eg.: 12) */

SELECT first_name, store_id, active, store_id ||'+'|| active as storeid_active, 
CONCAT(store_id,active) as storeid_active2
FROM customer;

/* SUB QUERIES!!! */

/*Exercise 28: List the category name's having more than 65 films */

SELECT c.name
FROM category c 
	JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.name
HAVING COUNT(fc.film_id) > 65;

/*Exercise 29: Same as before but replacing category table by one subquery;*/

SELECT c.name
FROM (SELECT * FROM category) as c 
	JOIN film_category fc on c.category_id=fc.category_id
GROUP BY c.name
HAVING COUNT(film_id)>65;

/*Exercise 30: Same as before but replacing category id table by one subquery;*/

SELECT c.name
FROM category c
WHERE category_id in (
	SELECT category_id
	FROM film_category
	GROUP BY category_id
	HAVING COUNT(film_id)>65)
	
	
	
/*HOW TO CREATE A TABLE! 

1) DE RAIZ!!!*/

CREATE TABLE IF NOT EXISTS students(
  nif int PRIMARY KEY,
  name VARCHAR (20) NOT NULL,
  age int,
  create_date TIMESTAMP
);

	
/*HOW TO CREATE A TABLE! 

2) COMO RESULTADO DE UMA QUERY!!!*/

CREATE TABLE IF NOT EXISTS category_frequency AS
SELECT c.name, COUNT(fc.film_id) frequency
FROM category c 
	JOIN film_category fc ON c.category_id=fc.category_id
	JOIN film ON fc.film_id=film.film_id
GROUP BY c.name
HAVING COUNT(title)>65;

/*2.Verify its content;*/
SELECT * FROM category_frequency;

/*3.Add column creation_date (as a timestamp)*/
ALTER TABLE category_frequency ADD COLUMN creation_date TIMESTAMP;

/*4.Delete the table’s data;*/
TRUNCATE TABLE category_frequency;

mantemos a estrutura e limpamos só os dados

/*5.Verify its content*/
SELECT * FROM category_frequency;

/*6.Delete the table;*/
DROP TABLE category_frequency;

/*7.Verify its content.*/
SELECT * FROM category_frequency;