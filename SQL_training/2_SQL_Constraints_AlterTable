-- CREATE DATABASE training;  

use training;

CREATE TABLE product(
prod_id INT primary key,
prod_name VARCHAR(100),
amont INT
);

insert into product values (1,'mobail',30000),(2,'laptop',70000),(3,'TV',60000),(4,'desktop',55000),
(5,'FRIGE',30000);
 
select * from product;
 
select * from company;
 
select * from company where company='infosys';
select * from company where company='infosys' and place='Bangalore'; 
 
select * from company where place='Chennai' and salary>5000;
 
select * from company where age >25;

select company ,age from company where age>25;

select * from company where age < 20 and place ='pune';

select * from company where age < 20 or place ='pune'; 

-- UPDATE and DELETE statement:

SELECT * FROM company WHERE place='';

SET sql_safe_updates=0;

UPDATE company SET place='Newyork'  WHERE place='';

SELECT * FROM company WHERE place='';

SELECT * FROM company WHERE place='Newyork';

SELECT * FROM product;

UPDATE product SET prod_name='Television' , amount=100000 WHERE prod_id=3;

SELECT * FROM product;

SELECT * FROM company;

-- DELETE RECORDS

SELECT * FROM product;

SELECT * FROM product WHERE prod_name='Fridge';

DELETE FROM product  WHERE prod_name='Fridge';

SELECT * FROM product;
SELECT * FROM product WHERE prod_id>2;
DELETE FROM product WHERE prod_id>2;
SELECT * FROM product;

SELECT * FROM company WHERE salary='';
DELETE FROM company WHERE salary='';
SELECT * FROM company;

 
 -- CONSTRAINT
 -- UNIQUE -> Allows only  the unique value
 -- NOT NULL
 -- CHECK
 -- DEFAULT
 -- PRIMARY KEY
 -- FOREIGN KEY
 
 CREATE TABLE unique_table(
 custid INT UNIQUE, -- we cant give the same id that give error
 custname varchar(100),
 age INT,
 city VARCHAR(100)
 );
 
INSERT INTO unique_table VALUES (100,'ramkunar',35,'chennei');
SELECT * FROM unique_table;
INSERT INTO unique_table VALUES (102,'Balaramkunar',30,'Hythrabad');
INSERT INTO unique_table VALUES (101,'Mohan',35,'banglore');
INSERT INTO unique_table(custname,age,city) VALUES ('Aveek',40,'Delhi');
INSERT INTO unique_table(custname,age,city) VALUES ('Chandra',30,'pune');



CREATE TABLE contry(
contry_id INT UNIQUE,
contry_name VARCHAR(100),
Contary_people INT
);

ALTER TABLE contry MODIFY Contary_people BIGINT;

INSERT INTO contry VALUES 
(1,'IND',1543535435),
(2,'USD',123473865),
(3,'NEPAL',23732874),
(4,'Shrilaka',742424734),
(5,'Chaina',273482487),
(6,'Dubai',3774264724),
(7,'Asroliya',376242872),
(8,'Philipince',3648274248),
(9,'Koriya',621415246),
(10,'Afganisthan',34674242);

SELECT * FROM contry;

set sql_safe_updates=0;
UPDATE contry 
SET contry_name ='United States' 
WHERE contry_name='USD';

SELECT * FROM contry;


SELECT * FROM product;
INSERT INTO product VALUES(6,'House',1000000);
INSERt INTO product (prod_id,prod_name) VALUES(7,'car');
INSERt INTO product (prod_name) VALUES('Bick');

INSERt INTO product VALUES(NULL,NULL,30000);

 -- NOT NULL
INSERT INTO unique_table VALUES (100,'ramkunar',35,'chennei');
SELECT * FROM unique_table;
INSERT INTO unique_table VALUES (102,'Balaramkunar',30,'Hythrabad');
INSERT INTO unique_table VALUES (101,'Mohan',35,'banglore');
INSERT INTO unique_table(custname,age,city) VALUES ('Aveek',40,'Delhi');
INSERT INTO unique_table(custname,age,city) VALUES ('Chandra',30,'pune'); 
SELECT * FROM unique_table;

CREATE TABLE Not_Null (
cust_id INT NOT NULL,
cust_name VARCHAR(100),
age INT,
city VARCHAR(100)
);

ALTER TABLE Not_Null MODIFY cust_name VARCHAR(100) UNIQUE;

INSERT INTO Not_Null VALUES (1,'Raja',25,'HAydrabad');
SELECT * FROM Not_Null;
INSERT INTO Not_Null VALUES (1,'Raja',25,'HAydrabad'); -- Duplicate Custemer Name
INSERT INTO Not_Null VALUES (1,'Rajesh',25,'HAydrabad');
SELECT * FROM Not_Null;
INSERT INTO Not_Null (cust_name,age,city) VALUES('Bala',40,'Banglore'); -- error custere id ia null
INSERT INTO Not_Null (cust_id,cust_name,age,city) VALUES(2,'Bala',40,'Banglore');
SELECT * FROM Not_Null;


-- CHECK CONSTRAINT

CREATE TABLE check_tebal(
cust_id INT UNIQUE NOT NULL,
cust_name VARCHAR(100) NOT NULL,
age INT CHECK (age >0 and age<100),
city VARCHAR(100)
);

INSERT INTO check_tebal VALUES (1,'Siva',30,'chennai'); 
INSERT INTO check_tebal VALUES (1,'Vankatesh',36,'Hydrabhad'); -- Error Duplicte Custemar name
INSERT INTO check_tebal (cust_id,age,city) VALUES ('Vankatesh',36,'Hydrabhad'); -- Error it is NUll
INSERT INTO check_tebal VALUES (2,'Vankatesh',36,'Hydrabhad');
SELECT *FROM check_tebal; 
INSERT INTO check_tebal VALUES (3,'Ramya',-1,'Delhi'); -- Error since age is less that 0
INSERT INTO check_tebal VALUES (3,'Ramya',101,'Delhi'); -- Error since age is gheter that 100
INSERT INTO check_tebal VALUES (3,'Ramya',25,'Delhi'); 
SELECT *FROM check_tebal; 

-- DEFAULT CONSTRAINT
CREATE TABLE defolt_tebal(
cuts_id INT UNIQUE NOT NULL,
cut_name VARCHAR(100) UNIQUE,
age INT CHECK (age>22 AND age<40),
city VARCHAR(100) DEFAULT 'Hydrabad'
);

ALTER TABLE Not_Null MODIFY cust_name VARCHAR(100) UNIQUE;
ALTER TABLE defolt_tebal MODIFY age INT CHECK (age>=22 AND age<=44);


INSERT INTO defolt_tebal VALUES (1,'Prakash',25,'Banglore');
INSERT INTO defolt_tebal VALUES (2,'Priya',20,'Banglore'); -- Error since age is <= 22
INSERT INTO defolt_tebal VALUES (2,'Priya',45,'Banglore'); -- Error since age is >= 40
INSERT INTO defolt_tebal VALUES (2,'Priya',30,'Banglore'); 
SELECT * FROM defolt_tebal;
INSERT INTO defolt_tebal (cuts_id,cut_name,age) VALUES (4,'Satya',32); 
UPDATE defolt_tebal SET cuts_id =3 WHERE cuts_id=4;
SELECT * FROM defolt_tebal;

CREATE TABLE defolt_tebal2(
cuts_id INT UNIQUE NOT NULL,
cut_name VARCHAR(100) UNIQUE,
age INT CHECK (age>22 AND age<40),
city VARCHAR(100) CHECK (city IN ( 'Chennei','Hydrabad','Banglore'))
);

INSERT INTO defolt_tebal2 VALUES (4,'Radhe',28,'Banglore');
SELECT * FROM defolt_tebal2;
INSERT INTO defolt_tebal2 (cuts_id,cut_name,age,city) VALUES (6,'Priya',30,'pune'); -- Error since the city name is chenge 
INSERT INTO defolt_tebal2 (cuts_id,cut_name,age,city) VALUES (6,'Priya',30,'Chennei'); 
SELECT * FROM defolt_tebal2;
