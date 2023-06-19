-- migrate:up
CREATE TABLE `showtimes` (
  `id` INT,
  `time` TIME,
  PRIMARY KEY (`id`)
)

-- migrate:down
DROP TABLE showtimes
