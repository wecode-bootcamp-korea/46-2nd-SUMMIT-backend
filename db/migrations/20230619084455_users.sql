-- migrate:up
CREATE TABLE `users` (
  `id` INT AUTO_INCREMENT,
  `email` VARCHAR(200),
  `name` VARCHAR(200),
  `phone_number` VARCHAR(200),
  `grade_id` INT,
  `kakao_id` BIGINT,
  `point` DECIMAL(12,2),
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
)

-- migrate:down
DROP TABLE users
