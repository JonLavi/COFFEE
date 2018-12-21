DROP TABLE products;
DROP TABLE blends;
DROP TABLE origins;
DROP TABLE roasts;
DROP TABLE types;
DROP TABLE producers;

CREATE TABLE producers
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  address VARCHAR(255)
);

CREATE TABLE blends
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE origins
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE roasts
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE types
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE products
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  producer_id INT8 REFERENCES producers(id) ON DELETE CASCADE,
  origin_id INT8 REFERENCES origins(id),
  roast_id INT8 REFERENCES roasts(id),
  blend_id INT8 REFERENCES blends(id),
  type_id INT8 REFERENCES types(id),
  weight INT8,
  unit_cost INT8,
  sell_price INT8,
  units_in_stock INT8,
  optimal_stock INT8
);
