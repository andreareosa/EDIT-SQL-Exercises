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


