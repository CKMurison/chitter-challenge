TRUNCATE TABLE users RESTART IDENTITY CASCADE; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (username, password, email) VALUES ('L4ZERH4WK', '12345', 'bob@email');
INSERT INTO users (username, password, email) VALUES ('Aphex', '54321', 'izzi@worm');
INSERT INTO users (username, password, email) VALUES ('Twin', '54', 'dave@worm');
