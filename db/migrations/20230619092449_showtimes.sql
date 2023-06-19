-- migrate:up
CREATE TABLE `showtimes` (
  `id` INT,
  `time` TIME NOT NULL,
  PRIMARY KEY (`id`)
)

-- migrate:down
DROP TABLE showtimes