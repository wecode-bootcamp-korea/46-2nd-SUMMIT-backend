-- migrate:up

CREATE TABLE `show_seats` (
  `id` INT AUTO_INCREMENT,
  `show_id` INT,
  `grade` VARCHAR(20) NOT NULL,
  `price` DECIMAL(12,2) NOT NULL,
  `theater_id` INT NOT NULL,
  `showtime_id` INT NOT NULL,
  `available_ticket` INT NOT NULL,
  `status_id` INT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_show_seats_show` FOREIGN KEY (`show_id`) REFERENCES `shows` (`id`),
  CONSTRAINT `fk_show_seats_status` FOREIGN KEY (`status_id`) REFERENCES `show_seats_status` (`id`),
  CONSTRAINT `fk_show_seats_theater` FOREIGN KEY (`theater_id`) REFERENCES `theaters` (`id`),
  CONSTRAINT `fk_show_seats_showtime` FOREIGN KEY (`showtime_id`) REFERENCES `showtimes` (`id`)
)

-- migrate:down
DROP TABLE show_seats