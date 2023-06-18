-- migrate:up
CREATE TABLE show_seats (
  id INT PRIMARY KEY,
  show_id INT,
  grade VARCHAR(20),
  price DECIMAL(12,2),
  quantity INT,
  status_id INT,
  FOREIGN KEY (show_id) REFERENCES shows(id),
  FOREIGN KEY (status_id) REFERENCES show_seats_status(id)
);

-- migrate:down
DROP TABLE show_seats
