-- migrate:up
CREATE TABLE `reservation_status` (
  `id` INT AUTO_INCREMENT,
  `status` VARCHAR(100),
  PRIMARY KEY (`id`)
)

-- migrate:down
DROP TABLE reservation_status
