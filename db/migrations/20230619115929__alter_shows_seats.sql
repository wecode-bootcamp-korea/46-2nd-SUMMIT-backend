-- migrate:up
ALTER TABLE show_seats ADD COLUMN age int null AFTER price;

-- migrate:down
ALTER TABLE show_seats DROP COLUMN age;