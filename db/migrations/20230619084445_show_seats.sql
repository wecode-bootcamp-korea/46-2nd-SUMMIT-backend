-- migrate:up

CREATE TABLE `show_seats` (
  `id` INT AUTO_INCREMENT,
  `show_id` INT,
  `grade` VARCHAR(20),
  `price` DECIMAL(12,2),
  `theater_id` INT,
  `showtime_id` INT,
  `available_ticket` INT,
  `status_id` INT,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_show_seats_show` FOREIGN KEY (`show_id`) REFERENCES `shows` (`id`),
  CONSTRAINT `fk_show_seats_status` FOREIGN KEY (`status_id`) REFERENCES `show_seats_status` (`id`),
  CONSTRAINT `fk_show_seats_theater` FOREIGN KEY (`theater_id`) REFERENCES `theaters` (`id`),
  CONSTRAINT `fk_show_seats_showtime` FOREIGN KEY (`showtime_id`) REFERENCES `showtimes` (`id`)
)

-- migrate:down
DROP TABLE show_seats
