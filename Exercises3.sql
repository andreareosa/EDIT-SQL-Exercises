/* CREATE A NEW TABLE - STUDENTS */

CREATE TABLE IF NOT EXISTS students(
  nif int PRIMARY KEY,
  name VARCHAR (20) NOT NULL,
  age int,
  create_date TIMESTAMP
);

/* 1.Verify the content of the new table */
SELECT * FROM students;

/* 2.Create a .csv file with the class data and copy that csv data into students table */
COPY students(nif,name,age)
FROM 'C:\Users\andre\OneDrive\Ambiente de Trabalho\EDIT\PROGRAMA\02. Databases Fundamental\SQL Exercises II\students.csv'
DELIMITER ','
CSV HEADER;

/* 3.Verify students table content;*/
SELECT * FROM students;

/* 4.try to repeat the copy activity - duplicate key value violates unique constraint "students_pkey" */
COPY students(nif,name,age)
FROM 'C:\Users\andre\OneDrive\Ambiente de Trabalho\EDIT\PROGRAMA\02. Databases Fundamental\SQL Exercises II\students.csv'
DELIMITER ','
CSV HEADER;

/* 6.Copy customer data into a csv file using pipe as delimiter; save it into C:\Users\Public */ 
COPY customer TO 
'C:\Users\andre\OneDrive\Ambiente de Trabalho\EDIT\PROGRAMA\02. Databases Fundamental\SQL Exercises II\customer.csv'
DELIMITER '|'
CSV HEADER;

/*CREATE NEW RECORDS FOR STUDENTS TABLE*/

/*1.Add a record to students table with nif=99, name= Sam, age=70 and create_date as the current date;*/
INSERT INTO students (nif,name,age,create_date) VALUES(99,'Sam',70, now())

/*2.Add two other records into the same table using a single “insert into” statement.*/
INSERT INTO students (nif,name,age,create_date) VALUES
	(100,'Andre',24, now()),
	(101,'Jessica',25,now())

/*3.Add customer_id and first_name from customer having customer_id<5;*/
INSERT INTO students(nif,name) 
SELECT customer_id,first_name FROM customer
WHERE customer_id < 5;


/*UPDATE DE REGISTOS DE TABELAS*/


/*1.Update students whose name as an 'a': age (if it is null, replace it by 50); name (concatenating nif; eg.: Anne123)*/
UPDATE students
SET age = COALESCE(age,50),
name = CONCAT(name,nif)
WHERE lower(name) LIKE '%a%';

/*2.Update students: change all create_dates to current date*/
UPDATE students
SET create_date = now();

/*DELETE DE REGISTOS DA TABELA*/

/*3.Delete students with nif>100*/
DELETE FROM students
WHERE nif>100;

/* Common table expression (CTE) */

/*1 - For each customer's first_name, how many actor exist with same first name? (Use a with clause)*/

WITH cte_actor AS (
	SELECT first_name, COUNT(first_name) as actor_count
	FROM actor 
	GROUP BY first_name
)
SELECT c.first_name, actor_count
FROM customer c 
	JOIN cte_actor on c.first_name = cte_actor.first_name;


/* CREATE DATABASE */

CREATE DATABASE my_first_db
 WITH ENCODING='UTF8'
 OWNER=postgres
 CONNECTION LIMIT=10;






