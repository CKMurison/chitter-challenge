TRUNCATE TABLE peeps RESTART IDENTITY CASCADE; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO peeps (time_posted, content, user_id) VALUES ('2023-11-23 12:45:00', 'Take a look at that peep!', '1');
INSERT INTO peeps (time_posted, content, user_id) VALUES ('2023-12-23 19:14:00', 'Just ate a croissant', '2');