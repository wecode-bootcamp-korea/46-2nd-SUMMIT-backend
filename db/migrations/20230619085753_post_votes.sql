-- migrate:up
CREATE TABLE `post_votes` (
  `id` INT AUTO_INCREMENT,
  `user_id` INT,
  `post_id` INT,
  `opinion` VARCHAR(100),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_post_votes_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_post_votes_post_id` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `uk_post_votes_user_post` UNIQUE KEY (`user_id`, `post_id`)
)

-- migrate:down
DROP TABLE post_votes
