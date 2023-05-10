Two Tables Design Recipe Template

Copy this recipe template to design and create two related database tables from a specification.

1. Extract nouns from the user stories or specification

# USER STORY:
# (analyse only the relevant part - here the final line).

STRAIGHT UP

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep

Nouns: 


2. Infer the Table Name and Columns

| table_name            | Properties          |
| --------------------- | ------------------  |
| peeps                 | time_posted, content,
| users                 | username, password, email

Put the different nouns in this table. Replace the example with your own nouns.

Record	Properties
peep,	  time_posted, content
user,   username, password, email
Name of the first table (always plural): users

Column users: username, password, email

Name of the second table (always plural): peeps

Column posts: time_posted, content

3. Decide the column types.

Here's a full documentation of PostgreSQL data types.

Most of the time, you'll need either text, int, bigint, numeric, or boolean. If you're in doubt, do some research or ask your peers.

Remember to always have the primary key id as a first column. Its type will always be SERIAL.

# EXAMPLE:

Table: users
id: SERIAL
username: text
password: text
email: text

Table: peeps
id: SERIAL
time_posted: timestamp
content: text

4. Decide on The Tables Relationship

Most of the time, you'll be using a one-to-many relationship, and will need a foreign key on one of the two tables.

To decide on which one, answer these two questions:

Can a user have many peeps? YES
Can a peep have many users? NO

users -> one-to-many -> peeps

The foregin key is on posts(user_id)


4. Write the SQL.

-- EXAMPLE
-- file: chitter_table.sql

-- Replace the table name, columm names and types.

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

5. Create the tables.

psql -h 127.0.0.1 chitter_table < chitter_table.sql