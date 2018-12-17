DROP TABLE products;
DROP TABLE producers;

CREATE TABLE producers
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  address VARCHAR(255)
);

CREATE TABLE products
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  producer_id INT8 REFERENCES producers(id) ON DELETE CASCADE,
  origin VARCHAR(255),
  roast VARCHAR(255),
  blend VARCHAR(255),
  type VARCHAR(255),
  weight INT8,
  unit_cost INT8,
  sell_price INT8,
  units_in_stock INT8,
  optimal_stock INT8
);
