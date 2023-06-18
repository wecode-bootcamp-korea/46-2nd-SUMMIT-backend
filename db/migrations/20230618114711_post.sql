-- migrate:up
CREATE TABLE post (
  id INT PRIMARY KEY,
  users_id INT,
  post_type_id INT,
  title VARCHAR(50),
  content VARCHAR(50),
  image_url VARCHAR(200),
  view BIGINT,
  rating DECIMAL(4,2),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  deleted_at TIMESTAMP,
  FOREIGN KEY (users_id) REFERENCES users(id),
  FOREIGN KEY (post_type_id) REFERENCES post_type(id)
);


-- migrate:down
DROP TABLE post
