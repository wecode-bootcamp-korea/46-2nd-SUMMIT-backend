-- migrate:up
CREATE TABLE `genres` (
  `id` INT AUTO_INCREMENT,
  `genre` VARCHAR(100),
  PRIMARY KEY (`id`)
)

-- migrate:down
DROP TABLE genres
