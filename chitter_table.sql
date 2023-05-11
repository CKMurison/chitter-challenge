CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username text,
  password text,
  email text
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  time_posted timestamp,
  content text,
  user_id int,
	constraint fk_user foreign key (user_id) references users(id)
  on delete cascade
);