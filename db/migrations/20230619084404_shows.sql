-- migrate:up
CREATE TABLE `shows` (
  `id` INT AUTO_INCREMENT,
  `title` VARCHAR(200),
  `content` TEXT,
  `image_url` VARCHAR(200),
  `running_time` VARCHAR(200),
  `genre_id` INT,
  `start_date` DATETIME,
  `end_date` DATETIME,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_shows_genre` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`)
)

-- migrate:down
DROP TABLE shows
