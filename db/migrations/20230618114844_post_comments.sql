-- migrate:up
CREATE TABLE post_comments (
  id INT PRIMARY KEY,
  users_id INT,
  post_id INT,
  content VARCHAR(200),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  deleted_at TIMESTAMP,
  FOREIGN KEY (users_id) REFERENCES users(id),
  FOREIGN KEY (post_id) REFERENCES posts(id)
);

-- migrate:down
DROP TABLE post_comments
