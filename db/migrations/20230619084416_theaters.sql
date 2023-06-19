-- migrate:up
CREATE TABLE `theaters` (
  `id` INT,
  `name` VARCHAR(200),
  `region` VARCHAR(200),
  PRIMARY KEY (`id`)
)

-- migrate:down
DROP TABLE theaters
