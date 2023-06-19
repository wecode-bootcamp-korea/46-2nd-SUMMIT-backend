-- migrate:up
CREATE TABLE `post_types` (
  `id` INT AUTO_INCREMENT,
  `type` VARCHAR(200),
  PRIMARY KEY (`id`)
)

-- migrate:down
DROP TABLE post_types
