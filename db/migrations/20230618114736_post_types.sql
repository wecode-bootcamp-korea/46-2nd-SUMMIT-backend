-- migrate:up
CREATE TABLE post_types (
  id INT PRIMARY KEY,
  type VARCHAR(200)
);

-- migrate:down
DROP TABLE post_types
