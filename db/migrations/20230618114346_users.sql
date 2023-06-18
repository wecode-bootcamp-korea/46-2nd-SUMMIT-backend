-- migrate:up
CREATE TABLE users (
  id INT PRIMARY KEY,
  email VARCHAR(200),
  name VARCHAR(200),
  phone_number VARCHAR(200),
  grad_id VARCHAR(50),
  kakao_id BIGINT,
  point DECIMAL(12,2)
);

-- migrate:down
DROP TABLE users
