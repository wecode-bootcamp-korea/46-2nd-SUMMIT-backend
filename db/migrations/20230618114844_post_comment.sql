-- migrate:up
CREATE TABLE post_comment (
  id INT PRIMARY KEY,
  users_id INT,
  post_id INT,
  post_comment_id INT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  FOREIGN KEY (users_id) REFERENCES users(id),
  FOREIGN KEY (post_id) REFERENCES post(id),
  FOREIGN KEY (post_comment_id) REFERENCES post_comment_likes(id)
);

-- migrate:down
DROP TABLE post_comment
