-- migrate:up
CREATE TABLE order_items (
  id INT PRIMARY KEY,
  order_id INT,
  quantity INT,
  FOREIGN KEY (order_id) REFERENCES orders(id)
);

-- migrate:down
DROP TABLE order_items
