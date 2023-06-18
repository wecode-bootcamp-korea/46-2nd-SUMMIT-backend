-- migrate:up
CREATE TABLE show_seat (
  id INT PRIMARY KEY,
  show_id INT,
  grade VARCHAR(20),
  price DECIMAL(12,2),
  quantity INT,
  status INT,
  FOREIGN KEY (show_id) REFERENCES shows(id)
);

-- migrate:down
DROP TABLE show_seat
