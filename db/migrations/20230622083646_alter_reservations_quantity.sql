-- migrate:up
ALTER TABLE reservations ADD COLUMN quantity INT NOT NULL;
ALTER TABLE reservations ADD COLUMN totalPrice INT NOT NULL;

-- migrate:down
ALTER TABLE reservations DROP COLUMN quantity INT NOT NULL;
ALTER TABLE reservations DROP COLUMN totalPrice INT NOT NULL;
