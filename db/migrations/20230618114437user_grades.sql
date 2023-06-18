-- migrate:up
CREATE TABLE user_grades (
  id INT PRIMARY KEY,
  grad_name VARCHAR(200),
  grade_score INT
);

-- migrate:down
DROP TABLE user_grades
