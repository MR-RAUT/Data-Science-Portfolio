use training;

-- PRIMARY KEY CONSTRAINT  (UNIQUE + NOT NULL)
CREATE TABLE pk_table(
custid INT PRIMARY KEY,     -- SIMPLE PRIMARY KEY
custname VARCHAR(100) NOT NULL,
age INT CHECK (age>20 and age<=60),
city VARCHAR(100) DEFAULT 'HYDERABAD',
mobile VARCHAR(100) UNIQUE
);

INSERT INTO pk_table VALUES (1000,'Madhan',36,'Chennei','9876543211');
SELECT * FROM Pk_table;
INSERT INTO pk_table  VALUES(1000,'Ravi',37,'Bangalore','9876543212'); -- ERROR since custid 1000 is duplicate value
INSERT INTO pk_table  VALUES(1001,'Ravi',37,'Bangalore','9876543212');
SELECT * FROM pk_table;
INSERT INTO pk_table(custname,age,city,mobile)  VALUES('Ganga',27,'Pune','9876543213');  -- ERROR since custid does't have a value
INSERT INTO pk_table(custid,custname,age,city,mobile)  VALUES(1002,'Ganga',27,'Pune','9876543213'); 
SELECT * FROM Pk_table;
INSERT INTO pk_table(custid,custname,age,city,mobile)  VALUES(1003,'Begam',27,'Pune','+91-9876543214');  
SELECT * FROM Pk_table;

CREATE TABLE pk_table_comp(
custid INT ,     -- SIMPLE PRIMARY KEY
custname VARCHAR(100) NOT NULL,
age INT CHECK (age>20 and age<=60),
city VARCHAR(100) DEFAULT 'HYDERABAD',
mobile VARCHAR(100) UNIQUE,
primary key (custid,custname)    -- COMPOSITE PRIMAY KEY
);

INSERT INTO pk_table_comp VALUES(1000,'Raja',30,'Chennai','9898989898');
SELECT * FROM pk_table_comp;
INSERT INTO pk_table_comp VALUES(1000,'Rajesh',30,'Chennai','9898989899');
SELECT * FROM pk_table_comp;
INSERT INTO pk_table_comp VALUES(1001,'Raja',30,'Chennai','9898989890');
SELECT * FROM pk_table_comp;
INSERT INTO pk_table_comp VALUES(1001,'Raja',36,'Bangalore','9898989891');  -- ERROR since '1001-Raja' is duplicate
SELECT * FROM pk_table_comp;

-- FOREIGN KEY

CREATE TABLE customers(
cust_id INT PRIMARY KEY,
custname VARCHAR(100) NOT NULL,
city VARCHAR(100) DEFAULT 'HYDERABAD'
);

INSERT INTO customers VALUES(1000,'Bala','Bangalore'),(1001,'Irfan','Hyderabad'),(1002,'Anand','Chennai');
SELECT * FROM customers;

CREATE TABLE orders (
ord_id INT primary key,
cust_id INT ,
produ_name varchar(100),
amount INT,
CONSTRAINT fk_orders FOREIGN KEY (cust_id) REFERENCES customers(cust_id)
);

INSERT INTO orders VALUES(1,1000,'Mobile',50000);
SELECT * FROM orders;
INSERT INTO orders VALUES(2,1003,'Laptop',100000);  -- 1003 is not present in the cusomers table
INSERT INTO orders VALUES(2,1001,'Laptop',100000); 
SELECT * FROM orders;

SELECT * FROM customers;
DELETE FROM customers WHERE cust_id=1000;  -- Can't delete 1000 since the child table orders has 1000 in it
-- If you want to remove the customer id 1000 then first we need to remove from child table and then we can remove from parent table
DELETE FROM orders WHERE cust_id=1000;
DELETE FROM customers WHERE cust_id=1000; 
SELECT * FROM customers;

DROP TABLE orders;

CREATE TABLE orders (
ord_id INT primary key,
cust_id INT ,
produ_name varchar(100),
amount INT,
CONSTRAINT fk_orders FOREIGN KEY (cust_id) REFERENCES customers(cust_id) ON DELETE CASCADE
);

INSERT INTO orders VALUES(1,1000,'Mobile',50000);
INSERT INTO orders VALUES(2,1001,'Laptop',100000);

 SELECT * FROM orders;

 DELETE FROM customers WHERE cust_id=1000; 

 DROP TABLE orders;
 
CREATE TABLE orders (
ord_id INT primary key,
cust_id INT ,
produ_name varchar(100),
amount INT,
CONSTRAINT fk_orders FOREIGN KEY (cust_id) REFERENCES customers(cust_id) ON UPDATE CASCADE
);

-- ======================================auto_increment=================================
DROP TABLE users;

CREATE TABLE users(
user_id INT UNIQUE auto_increment,
user_name VARCHAR(100),
city VARCHAR(100)
);

INSERT INTO users(user_name, city) VALUES('Ganesh','Mumbai');
SELECT * FROM users;
INSERT INTO users(user_name, city) VALUES('Ramya','Kolkatta');
SELECT * FROM users;
INSERT INTO users(user_name, city) VALUES('Siva','Chennai');
SELECT * FROM users;
INSERT INTO users VALUES(100,'Raghul','Chennai');
SELECT * FROM users;
INSERT INTO users(user_name, city) VALUES('Venkatesh','Hyderabad');
SELECT * FROM users;
INSERT INTO users VALUES(50,'Ashwin','Chennai');
SELECT * FROM users;
INSERT INTO users(user_name, city) VALUES('Tharani','Hyderabad');
SELECT * FROM users;

-- ========================================================

-- ALTER STATEMENT
-- ADD A NEW COLUMN
-- REMOVE THE COLUMN
-- MODIFYING THE COLUMN
-- RENAMING THE COLUMN
-- RENAMING THE TABLE

SELECT * FROM CUSTOMERS;
DESC CUSTOMERS;

ALTER TABLE customers ADD COLUMN contry VARCHAR(100);

INSERT INTO CUSTOMERS VALUES (1003,'Durga','Hydrabad','India');
SELECT * FROM CUSTOMERS;

UPDATE customers set contry='India' WHERE contry is NULL; 

ALTER TABLE customers
ADD COLUMN profession VARCHAR (100) DEFAULT 'Software Engineer';
SELECT * FROM customers;

DESC customers;

-- REMOVE THE COLUMN

ALTER TABLE customers DROP COLUMN contry;
SELECT * FROM CUSTOMERS;   

-- MODIFYING THE COLUMN
ALTER TABLE customers MODIFY COLUMN city VARCHAR(20);
ALTER TABLE customers MODIFY COLUMN city VARCHAR(20) DEFAULT 'New dehli';

ALTER TABLE customers MODIFY custname VARCHAR(100) UNIQUE;
DESC customers;

-- RENAMING THE COLUMN

ALTER TABLE customers RENAME column city TO Location;
DESC customers;
SELECT * FROM CUSTOMERS;

-- RENAMING THE TABLE
ALTER TABLE  customers RENAME TO grahak;
ALTER TABLE  grahak RENAME TO  customers;

-- ADD PK CONSTRAIN
DESC product;
ALTER TABLE product ADD PRIMARY KEY (prod_name);

ALTER TABLE product MODIFY amont INT CHECK (amont>0);
SELECT * FROM product;
DESC product;

INSERT INTO product VALUES(12,'toys',0); -- ERRPR
INSERT INTO product VALUES(12,'toys',100); 
SELECT * FROM product;

-- DELETE , TRUNCATE , DROP
-- DELETE statement can be used to delete one/many/all rows

DELETE FROM product WHERE amont IS NULL;
SELECT * FROM product;

DELETE FROM product WHERE amont>50000;
SELECT * FROM product;

DELETE FROM  product;
SELECT * FROM product; 

-- TRUNCATE
-- TRUNCATE is delete all the records in a table
SELECT * FROM users;
TRUNCATE TABLE users;
SELECT * FROM users;

-- DROP 
-- Drop will delete the entair data as well as the tabale as well.
SELECT * FROM customer;
DROP TABLE customer; 
SELECT * FROM customer; 

--  TCL -  TRANSACTION CONTROL LANGUAGE

START TRANSACTION;
SELECT * FROM customers;

DELETE FROM customers WHERE custname IN ('Irfan','Anand');
SELECT * FROM customers;

COMMIT;

SELECT * FROM unique_table;
START TRANSACTION;

DELETE FROM unique_table;
SELECT * FROM unique_table;

ROLLBACK;

START TRANSACTION;
DELETE FROM unique_table WHERE custid IS NULL;
SELECT * FROM unique_table;

COMMIT;

START TRANSACTION;
SELECT * FROM unique_table;

TRUNCATE unique_table;
SELECT * FROM unique_table;
ROLLBACK;
SELECT * FROM unique_table;

START TRANSACTION;
SELECT * FROM company;

SAVEPOINT p1;
UPDATE company SET Salary =10000 WHERE Salary='';
SELECT * FROM company;

SAVEPOINT p2;
UPDATE company SET Company ='WIPRO' WHERE Company='';
SELECT * FROM company;

SAVEPOINT p3;
DELETE FROM Company WHERE Place='';
SELECT * FROM company;

SAVEPOINT p4;
DELETE FROM Company WHERE age=0;
SELECT * FROM Company;

ROLLBACK TO SAVEPOINT p4;
ROLLBACK TO SAVEPOINT p3;

ROLLBACK;
SELECT * FROM Company;
 
COMMIT;
SELECT * FROM Company;
