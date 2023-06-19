-- migrate:up
CREATE TABLE `post_comments` (
  `id` INT AUTO_INCREMENT,
  `user_id` INT,
  `post_id` INT,
  `post_vote_id` INT,
  `content` VARCHAR(200) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_post_comments_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_post_comments_post_id` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `fk_post_comments_post_vote_id` FOREIGN KEY (`post_vote_id`) REFERENCES `post_votes` (`id`)
)

-- migrate:down
DROP TABLE post_comments
