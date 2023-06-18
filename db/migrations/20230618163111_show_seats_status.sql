-- migrate:up
CREATE TABLE show_seats_status (
  id INT PRIMARY KEY,
  status VARCHAR(100)
);

-- migrate:down
DROP TABLE show_seats_status
