CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  time_posted timestamp,
  content text
);


-- Then the table with the foreign key first.
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username text,
  password text,
  email text,
-- The foreign key name is always {other_table_singular}_id
  peep_id int,
	constraint fk_peep foreign key (peep_id) references peeps(id)
);