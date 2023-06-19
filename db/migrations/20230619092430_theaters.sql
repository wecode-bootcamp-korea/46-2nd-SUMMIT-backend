-- migrate:up
CREATE TABLE `theaters` (
  `id` INT,
  `name` VARCHAR(200) NOT NULL,
  `region` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`)
)

-- migrate:down
DROP TABLE theaters