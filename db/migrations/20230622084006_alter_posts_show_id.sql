-- migrate:up
ALTER TABLE posts ADD COLUMN show_id INT NULL;

-- migrate:down
ALTER TABLE posts DROP COLUMN show_id INT NULL;
