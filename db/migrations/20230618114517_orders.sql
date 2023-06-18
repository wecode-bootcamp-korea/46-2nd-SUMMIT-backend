-- migrate:up
CREATE TABLE orders (
  id INT PRIMARY KEY,
  show_id INT,
  users_id INT,
  order_number UUID,
  order_status_id INT,
  total_price DECIMAL(12,2),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  deleted_at TIMESTAMP,
  FOREIGN KEY (show_id) REFERENCES shows(id),
  FOREIGN KEY (users_id) REFERENCES users(id),
  FOREIGN KEY (order_status_id) REFERENCES order_status(id)
);

-- migrate:down
DROP TABLE orders
