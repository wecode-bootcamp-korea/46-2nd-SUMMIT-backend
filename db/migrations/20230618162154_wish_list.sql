-- migrate:up
CREATE TABLE wish_list (
  id INT PRIMARY KEY,
  user_id INT,
  show_id INT,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (show_id) REFERENCES

-- migrate:down
DROP TABLE wish_list
