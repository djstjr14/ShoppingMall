-- Initialize the database.
-- Drop any existing data and create empty tables.

DROP TABLE IF EXISTS client;
DROP TABLE IF EXISTS delivery;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS coupon;
DROP TABLE IF EXISTS productNum;

CREATE TABLE client (
  id        UNSIGNED INTEGER PRIMARY KEY AUTOINCREMENT,
  email     VARCHAR(50) UNIQUE NOT NULL,
  name      VARCHAR(50) NOT NULL,
  password  VARCHAR(100) NOT NULL,
  phone     UNSIGNED INTEGER UNIQUE NOT NULL,
  address   VARCHAR(100),
  mileage   UNSIGNED INTEGER
);

CREATE TABLE delivery (
  track_number        UNSIGNED INTEGER PRIMARY KEY AUTOINCREMENT,
  order_id            UNSIGNED INTEGER UNIQUE NOT NULL,
  delivery_company    VARCHAR(50) NOT NULL,
  location            VARCHAR(100) NOT NULL,
  status              INTEGER NOT NULL,
  date_arrived        TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE product (
  product_id  INTEGER PRIMARY KEY AUTOINCREMENT,
  name        VARCHAR(50) UNIQUE NOT NULL,
  category    VARCHAR(10) NOT NULL,
  price       FLOAT NOT NULL,
  stock       INTEGER NOT NULL ,
  dc_rate     INTEGER DEFAULT '0' NOT NULL,
  sales_num   INTEGER DEFAULT '0' NOT NULL
);


create table coupon (
  coupon_id              UNSIGNED integer primary key autoincrement,
  name            string not null,
  rate_of_discount  double not null,

);

create table productNum (
  coupon_id UNSIGNED integer primary key autoincrement,
  FOREIGN KEY product_id REFERENCES  product
);

INSERT INTO delivery (order_id, delivery_company, location, status) VALUES (1,   "LOGEN",   "Busan", 1)
INSERT INTO delivery (order_id, delivery_company, location, status) VALUES (2, "HYUNDAI",   "Seoul", 0)
INSERT INTO delivery (order_id, delivery_company, location, status) VALUES (3,   "LOGEN", "Gwangju", 1)
INSERT INTO delivery (order_id, delivery_company, location, status) VALUES (4,  "HANJIN",   "Seoul", 0)
INSERT INTO Delivery (order_id, delivery_company, location, status) VALUES (5,  "HANJIN",   "BUSAN", 1)