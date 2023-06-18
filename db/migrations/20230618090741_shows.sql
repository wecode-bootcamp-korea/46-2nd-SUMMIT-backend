-- migrate:up
CREATE TABLE shows (
  id INT PRIMARY KEY,
  title VARCHAR(200),
  content VARCHAR(200),
  image_url VARCHAR(200),
  running_time VARCHAR(200),
  address VARCHAR(200),
  address_detail VARCHAR(200),
  thumbnail VARCHAR(200),
  detail_explanation TEXT,
  total INT,
  rating_average DECIMAL(4,2),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

-- migrate:down
DROP TABLE shows
