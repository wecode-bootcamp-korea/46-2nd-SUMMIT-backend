-- migrate:up
CREATE TABLE users_grade (
  id INT PRIMARY KEY,
  grad_name VARCHAR(200),
  grade_score INT
);

-- migrate:down
DROP TABLE grade
