-- migrate:up
CREATE TABLE shows (
  id INT PRIMARY KEY,
  title VARCHAR(200),
  content TEXT,
  image_url VARCHAR(200),
  running_time VARCHAR(200),
  address VARCHAR(200),
  address_detail VARCHAR(200),
  genre_id INT,
  score_average DECIMAL(4,2),
  start_date DATETIME,
  end_date DATETIME,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  FOREIGN KEY (genre_id) REFERENCES genres(id)
);

-- migrate:down
DROP TABLE shows
