-- migrate:up
CREATE TABLE users (
  id INT PRIMARY KEY,
  email VARCHAR(200),
  name VARCHAR(200),
  phone_number VARCHAR(200),
  grade_id INT,
  kakao_id BIGINT,
  point DECIMAL(12,2),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  deleted_at TIMESTAMP,
  FOREIGN KEY (grade_id) REFERENCES user_grades(id)
);
-- migrate:down
DROP TABLE users
