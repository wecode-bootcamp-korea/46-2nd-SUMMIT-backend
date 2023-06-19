-- migrate:up
CREATE TABLE `show_seats_status` (
  `id` INT AUTO_INCREMENT,
  `status` VARCHAR(100),
  PRIMARY KEY (`id`)
)

-- migrate:down
DROP TABLE show_seats_status
