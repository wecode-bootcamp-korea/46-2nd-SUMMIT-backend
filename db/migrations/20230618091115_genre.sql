-- migrate:up
CREATE TABLE genre (
  id INT PRIMARY KEY,
  shows_id INT,
  genre_id INT,
  FOREIGN KEY (shows_id) REFERENCES shows(id),
  FOREIGN KEY (genre_id) REFERENCES shows(id)
);

-- migrate:down
DROP TABLE genre
