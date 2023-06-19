-- migrate:up
CREATE TABLE `genres` (
  `id` INT AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`)
)

-- migrate:down
DROP TABLE genres