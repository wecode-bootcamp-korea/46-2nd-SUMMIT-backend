-- migrate:up
CREATE TABLE post_type (
  id INT PRIMARY KEY,
  type VARCHAR(200)
);

-- migrate:down
DROP TABLE post_type
