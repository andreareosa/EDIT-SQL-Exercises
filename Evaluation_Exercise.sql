/*1. Change the PK: it should include address_id only!*/

/*1.1 - Drop the current constraint*/
ALTER TABLE address
DROP CONSTRAINT pk_address;

/*1.2 - Create the new constraint*/
ALTER TABLE address
ADD CONSTRAINT pk_address PRIMARY KEY (address_id);

/*1.Add the following data to country table with 1 single “insert into” statement:
1.1 - 1; Portugal; pt
1.1 - 2; Spain; es*/
INSERT INTO country (country_id,country_name,language) VALUES
	(1,'Portugal','pt'),
	(2,'Spain','es')
	

/* 2.Create a csv file with 5 rows to add into city table;
Add that data to city table, by reading from the txt file */
COPY city (city_id,city_name,country_id,region)
FROM 'C:\Users\andre\OneDrive\Ambiente de Trabalho\EDIT\PROGRAMA\02. Databases Fundamental\SQL Exercises II\city.txt'
DELIMITER ','
CSV HEADER;

/* 3.Add the following data to address table:
i. - 1; Rua torta; 1;1; current datetime
ii. - 2;; 1;2; current datetime
iii. - 3; Rua direita; 2;2; current datetime*/

INSERT INTO address (address_id,street,number,city_id,last_updt_date) VALUES
	(1,'Rua torta',1,1,now()),
	(2,null,1,2,now()),
	(3,'Rua direita',2,2,now());


/* 4 - Change Rua direita to Rua esquerda */
UPDATE address
SET street = 'Rua esquerda'
WHERE address_id = 3;



/* ------ EVALUATION EXERCISE -------*/

/*TABLE CUSTOMER*/
CREATE TABLE customer(
	customer_id INT PRIMARY KEY,
	customer_name VARCHAR(25)
	);

/*TABLE PRODUCT*/
CREATE TABLE product(
	product_id INT PRIMARY KEY,
	prod_name VARCHAR(40),
	price NUMERIC(5,2) NOT NULL,
	last_updt_date TIMESTAMP
	);

/*TABLE ORDERS*/
CREATE TABLE orders(
	date TIMESTAMP,
	customer_id INT,
	product_id INT,
	quantity NUMERIC(5,2) NOT NULL
	);

/*ALTER TABLE ORDERS - ADD CONSTRAINTS*/
ALTER TABLE orders
ADD CONSTRAINT pk_orders PRIMARY KEY (date,customer_id,product_id),
ADD CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
ADD CONSTRAINT fk_orders_product FOREIGN KEY (product_id) REFERENCES product (product_id);


/* INSERT 5 RECORDS IN PRODUCT TABLE*/
INSERT INTO product (product_id,prod_name,price,last_updt_date) VALUES
	(1,'computer',999,now()),
	(2,'ram',120,now()),
	(3,'cooler',80,now()),
	(4,'mouse',45,now()),
	(5,'mousepad',30,now());

/* INSERT 5 RECORDS ON CUSTOMER TABLE*/
INSERT INTO customer (customer_id,customer_name) VALUES
	(1,'Andre'),
	(2,'John'),
	(3,'Sarah'),
	(4,'Jessica'),
	(5,'Anna');
	
/* INSERT 3 RECORDS ON ORDERS TABLE, ALL FOR THE SAME DATE AND CUSTOMER*/
INSERT INTO orders(date,customer_id,product_id,quantity) VALUES
	(now(),1,1,1),
	(now(),1,2,1),
	(now(),1,3,1);

SELECT * FROM product





