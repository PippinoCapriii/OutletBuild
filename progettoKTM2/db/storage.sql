DROP DATABASE IF EXISTS storage;
CREATE DATABASE storage;
USE storage;

DROP TABLE IF EXISTS product;

CREATE TABLE product (	
  code int primary key AUTO_INCREMENT,
  name char(20) not null,
  description char(100),
  price int default 0,
  quantity int default 0,
  marca char(20) not null,
  image VARCHAR(20)
);

INSERT INTO product values (1,"felpa","falsa",20,5,"Gucci");
INSERT INTO product values (2,"felpa","falsa",15,13,"Nike");
INSERT INTO product values (3,"t-shirt","falsa",9,4,"Gucci");
INSERT INTO product values (4,"scarpa","falsa",30,11,"Luis-vuittone");
INSERT INTO product values (5,"pantalone","falsa",10,3,"Dior");
