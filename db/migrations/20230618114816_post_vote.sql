-- migrate:up
CREATE TABLE post_vote (
  id INT PRIMARY KEY,
  users_id INT,
  post_id INT,
  agree INT,
  opposite INT,
  FOREIGN KEY (users_id) REFERENCES users(id),
  FOREIGN KEY (post_id) REFERENCES post(id)
);

-- migrate:down
DROP TABLE post_vote
