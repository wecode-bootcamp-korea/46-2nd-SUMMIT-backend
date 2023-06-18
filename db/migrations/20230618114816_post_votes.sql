-- migrate:up
CREATE TABLE post_votes (
  id INT PRIMARY KEY,
  users_id INT,
  post_id INT,
  agree INT DEFAULT 0,
  opposite INT DEFAULT 0,
  UNIQUE KEY (users_id, post_id),
  FOREIGN KEY (users_id) REFERENCES users(id),
  FOREIGN KEY (post_id) REFERENCES posts(id)
);
);

-- migrate:down
DROP TABLE post_votes
