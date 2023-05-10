TRUNCATE TABLE users RESTART IDENTITY CASCADE; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (id, username, password, email, peep_id) VALUES ('1','L4ZERH4WK', '12345', 'bob@email', '1');
INSERT INTO users (id, username, password, email, peep_id) VALUES ('2','Aphex', '54321', 'izzi@worm', '2');
