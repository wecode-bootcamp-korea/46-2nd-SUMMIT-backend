-- migrate:up
CREATE TABLE `reservation_items` (
  `id` INT AUTO_INCREMENT,
  `reservation_id` INT,
  `quantity` INT,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_reservation_items_reservation` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`id`)
)

-- migrate:down
DROP TABLE reservation_items
