-- migrate:up
CREATE TABLE `users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(200) NOT NULL,
  `name` VARCHAR(200) NOT NULL,
  `phone_number` VARCHAR(200) NOT NULL,
  `kakao_id` BIGINT NOT NULL,
  `point` DECIMAL(12,2) NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
)

-- migrate:down
DROP TABLE users