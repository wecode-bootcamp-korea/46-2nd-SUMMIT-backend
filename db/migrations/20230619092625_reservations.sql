-- migrate:up
CREATE TABLE `reservations` (
  `id` INT AUTO_INCREMENT,
  `show_id` INT,
  `user_id` INT,
  `show_seats_id` INT,
  `reservation_number` VARCHAR(200),
  `reservation_status_id` INT,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_reservations_shows` FOREIGN KEY (`show_id`) REFERENCES `shows` (`id`),
  CONSTRAINT `fk_reservations_show_seats` FOREIGN KEY (`show_seats_id`) REFERENCES `show_seats` (`id`),
  CONSTRAINT `fk_reservations_status` FOREIGN KEY (`reservation_status_id`) REFERENCES `reservation_status` (`id`),
  CONSTRAINT `fk_reservations_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
)

-- migrate:down
DROP TABLE reservations