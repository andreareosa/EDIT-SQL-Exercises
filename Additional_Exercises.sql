/*1-Para cada categoria (refiro-me a category.name) de filmes cujo título inclui a letra 'u' (minúscula ou maiúscula), quais as cidades dos clientes
que alugaram os filmes associados às mesmas?
[Pretende-se ver 2 colunas: nome da categoria; cidade.] */

SELECT c.name as film_category, cy.city as customer_city
FROM category c
	JOIN film_category fa on c.category_id = fa.category_id
	JOIN film f on fa.film_id = f.film_id
	JOIN inventory i on f.film_id = i.film_id
	JOIN rental r on i.inventory_id = r.inventory_id
	JOIN customer ct on r.customer_id = ct.customer_id
	JOIN address ad on ct.address_id = ad.address_id
	JOIN city cy on ad.city_id = cy.city_id
WHERE c.name LIKE '%U%' 
OR c.name LIKE '%u%';

/*2 - Para cada língua (language.name), quantos filmes existem? [Pretende-se ver a contagem para todas as línguas, mesmo quando há zero filmes.]*/
SELECT l.name as language, COUNT(f.title) as number_of_films
FROM language l
	LEFT JOIN film f on l.language_id = f.language_id
GROUP BY l.name;
	
/* 3 - Para cada língua (language.name), quantos filmes, alugados por clientes cujo nome começa por 'A', existem?
[Pretende-se ver a contagem para todas as línguas, mesmo quando há zero filmes.]*/	

SELECT l.name as language, COUNT(f.title) as number_of_films
FROM language l
	LEFT JOIN film f on l.language_id = f.language_id
	JOIN inventory i on f.film_id = i.film_id
	JOIN rental r on i.inventory_id = r.inventory_id
	JOIN customer c on r.customer_id = c.customer_id
WHERE c.first_name LIKE 'A%'
GROUP BY l.name;


	