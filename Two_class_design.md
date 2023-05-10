User & Peeps Model and Repository Classes Design Recipe

Copy this recipe template to design and implement Model and Repository classes for a database table.

1. Design and create the Table

If the table is already created in the database, you can skip this step.

Otherwise, follow this recipe to design and create the SQL schema for your table.

In this template, we'll use an example table students

# EXAMPLE

Table: students

Columns:
id | name | cohort_name
2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

-- EXAMPLE
-- (file: spec/seeds_SN_database.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE students RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO students (name, cohort_name) VALUES ('David', 'April 2022');
INSERT INTO students (name, cohort_name) VALUES ('Anna', 'May 2022');
Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

psql -h 127.0.0.1 your_database_name < seeds_{table_name}.sql
3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by Repository for the Repository class name.


# Table name: users

# Table name: peeps


# Model class
# (in lib/users.rb)
class Users
  attr_reader: :id, :username, :password, :email
end


# Model class
# (in lib/Peeps.rb)
class Peeps
  attr_reader: :id, :time_posted, :content
end


# Repository class
# (in lib/users_repository.rb)
class UsersRepository

end

# (in lib/peeps_repository.rb)
class PeepsRepository

end


5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

# EXAMPLE
# Table name: users

# Repository class
# (in lib/users_repository.rb)

class UsersRepository

  # Selecting all records
  # No arguments
  def all
   # Executes the SQL query:
   # SELECT id, username, password, email FROM users;

   # Returns an array of User objects.
  end

  # Select a single record
  # Given the id in arguemnt (a number)
  def find(id)
   # Executes the SQL query
   # SELECT id, username, pasword, email FROM users WHERE id = $1; 
  end

  # inserts a new users record
  # Takes an Users object as an argument
  def create(users)
   # Executes SQL query
   # INSERT INTO users (username, password, email) VALUES($1, $2, $3);

   # Doesn't need to return anything (only creates a record)
   # return nil
  end

  # Deletes an users record
  # Given its id
  def delete(id)
   # Executes the SQL
   # DELETE FROM users WHERE id = $1;

   # Returns nothing (only deletes the record)
   # return nil
  end

  # Updates the users record
  # Take an Users object (with the updated fields)
  def update(users)
   # Executes the sql query
   # UPDATE users SET username = $1, password = $2, email = $3 WHERE id = $4;

   # Returns nothing (only updates the record)
   # returns nil
  end

  # end
end


# EXAMPLE
# Table name: peeps

# Repository class
# (in lib/peeps_repository.rb)

class PostsRepository

  # Selecting all records
  # No arguments
  def all
   # Executes the SQL query:
   # SELECT id, time_posted, content, FROM peeps;

   # Returns an array of User objects.
  end

  # Select a single record
  # Given the id in arguemnt (a number)
  def find(id)
   # Executes the SQL query
   # SELECT id, time_posted, content FROM peeps WHERE id = $1; 
  end

  # inserts a new users record
  # Takes an Users object as an argument
  def create(peeps)
   # Executes SQL query
   # INSERT INTO peeps (time_posted, content) VALUES($1, $2);

   # Doesn't need to return anything (only creates a record)
   # return nil
  end

  # Deletes an users record
  # Given its id
  def delete(id)
   # Executes the SQL
   # DELETE FROM peeps WHERE id = $1;

   # Returns nothing (only deletes the record)
   # return nil
  end

  # Updates the users record
  # Take an Users object (with the updated fields)
  def update(peeps)
   # Executes the sql query
   # UPDATE peeps SET username = $1, content = $2, WHERE id = $3;
   
   # Returns nothing (only updates the record)
   # returns nil
  end

  # end
end
6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

# EXAMPLES

# 1
# Get all Users

repo = UsersRepository.new

user = repo.all
user.length => 2
user.first.id => 1
user.first.email => 'cameron@gmail'

# 2 
# Find a certian user

    repo = UsersRepository.new
    user = repo.find(1)
    expect(user.email_address).to eq 'cameron@gmail'
    expect(user.username).to eq 'EpicCam'

    repo = UsersRepository.new
    user = repo.find(2)
    expect(user.email).to eq 'jim@yahoo'
    expect(user.username).to eq 'Jim92'

# 3 Create new user

    repo = UsersRepository.new

    new_user = Users.new
    new_user.email= 'Jim@bing'
    new_user.username = 'Big Jim'

    repo.create(new_user)

    users = repo.all
    last_user = users.last

    expect(last_users.email).to eq('Jim@bing')
    expect(last_users.username).to eq('Big Jim')


# 4 Delete a user

repo = UsersRepository.new

id_to_delete = 1

repo.delete(id_to_delete)

all_users = repo.all
all_users.length => 1
all_users.first.id => 2


# 1
# Get all Peeps

repo = PeepsRepository.new

peep = repo.all
peep.length => 4
peep.first.id => 1
peep.first.content => 'Hey I'm Peeping over here'

# 2 
# Find a certian Peep

    repo = PeepsRepository.new
    peep = repo.find(1)
    expect(peep.time_posted).to eq '2023-11-23 12:45'
    expect(pee.content).to eq 'Hey I'm Peeping over here'


    repo = PeepsRepository.new
    peep = repo.find(2)
    expect(peep.time_posted).to eq '2023-8-14 12:50'
    expect(peep.content).to eq 'What a nice peep'
  
# 3 Create new Peeps

    repo = PeepsRepository.new

    new_peep = Peeps.new
    new_peep.time_posted = '1999-11-11 11:45'
    new_peep.content = 'This is the nightmare'

    repo.create(new_peep)

    peeps = repo.all
    last_peep = peeps.last

   expect(last_peep.time_posted).to eq '1999-11-11 11:45'
    expect(last_peep.content).to eq 'This is the nightmare'


# 4 Delete a Peep

repo = PeepsRepository.new

id_to_delete = 1

repo.delete(id_to_delete)

all_peeps = repo.all
all_peeps.length => 1
all_peeps.first.id => 2




7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

# EXAMPLE

# file: spec/users_repository_spec.rb

def reset_users_table
  seed_sql = File.read('spec/user_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_table_test' })
  connection.exec(seed_sql)
end

describe UsersRepository do
  before(:each) do 
    reset_users_table
  end

  # file: spec/posts_repository_spec.rb

def reset_posts_table
  seed_sql = File.read('spec/peeps_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_table_test' })
  connection.exec(seed_sql)
end

describe PeepsRepository do
  before(:each) do 
    reset_peeps_table
  end

  # (your tests will go here).
end
8. Test-drive and implement the Repository class behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.