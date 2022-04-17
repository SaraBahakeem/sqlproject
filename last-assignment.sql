
use store;
-- create a table
-- 1 
CREATE TABLE countries (
  code int PRIMARY KEY,
  name varchar(20) ,
  contient_name varchar(20) NOT NULL,
  CONSTRAINT UC_name UNIQUE (name)
);
-- 2
CREATE TABLE users (
  id int PRIMARY KEY,
  full_name varchar(20) ,
  email varchar(20) NOT NULL,
  gender char(1),
  date_of_birth varchar(15),
  created_at datetime DEFAULT CURRENT_TIMESTAMP,
  country_code int,
  FOREIGN KEY (country_code) REFERENCES Countries(code),
  CONSTRAINT UC_email UNIQUE (email),
  CONSTRAINT CHK_gender CHECK (gender='m' or gender='f')
);
-- 3
CREATE TABLE orders (
  id int PRIMARY KEY,
  user_id int,
  status varchar(6),
  created_at datetime DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id),
  CONSTRAINT CHK_status CHECK (status='start' or status='finish')
);
-- 4
CREATE TABLE products (
  id int PRIMARY KEY,
  name varchar(10) NOT NULL,
  price int DEFAULT 0,
  status varchar(10),
  created_at datetime DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT CHK_status CHECK (status='valid' or status='expired')
);
-- 5
CREATE TABLE order_products (
  order_id int,
  product_id int,
  quantity int DEFAULT 0,
  PRIMARY KEY (order_id, product_id),
  FOREIGN KEY (order_id) REFERENCES orders(id),
  FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);
-- DML Commands
-- 1
INSERT INTO countries VALUES (1, 'Saudi Arabua', 'Asia');
-- 2
INSERT INTO users (id, full_name, email, gender, date_of_birth, country_code) VALUES (1, 'Sara Bahakeem', 'smbahake@iu.edu','f','10/8/97',1);
-- 3
INSERT INTO orders (id, user_id, status) VALUES (1, 1, 'start');
-- 4 
INSERT INTO products (id, name, price, status) VALUES (1, 'lipstick', 120, 'valid');
INSERT INTO products (id, name, price, status) VALUES (2, 'blusher', 90, 'expired');

-- 5 
INSERT INTO order_products VALUES (1, 1, 2);
-- 6 
UPDATE Countries 
SET 
name = 'المملكة العربية السعودية'
WHERE code = 1;
-- 7 
delete from products 
where status = 'expired';




select * from Countries;
select * from users;
select * from orders;
select * from products;
select * from order_products;
