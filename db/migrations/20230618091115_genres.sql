-- migrate:up
CREATE TABLE genres (
  id INT PRIMARY KEY,
  genre VARCHAR(100)
);

-- migrate:down
DROP TABLE genres