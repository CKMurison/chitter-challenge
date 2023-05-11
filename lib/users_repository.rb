require_relative 'users'

class UsersRepository
  def all
    sql = 'SELECT id, username, password, email FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])

    users = []
    result_set.each do |record|
      user = User.new
      user.id = record['id']
      user.username = record['username']
      user.password = record['password']
      user.email = record['email']
     

      users << user
    end
    return users
  end

  def find(id)
    sql = 'SELECT id, username, password, email FROM users WHERE id = $1;'
    sql_params = [id]
    result_set = DatabaseConnection.exec_params(sql, sql_params)

    record = result_set[0]

    user = User.new
    user.id = record['id']
    user.username = record['username']
    user.password = record['password']
    user.email = record['email']

    return user
  end
  def create(users)
    # Executes SQL query
    sql = 'INSERT INTO users (username, password, email) VALUES($1, $2, $3);'
    sql_params = [users.username, users.password, users.email]
    DatabaseConnection.exec_params(sql, sql_params)
    # Doesn't need to return anything (only creates a record)
    return nil
   end

   def delete(id)
    # Executes the SQL
    sql = 'DELETE FROM users WHERE id = $1;'
    sql_params = [id]
    DatabaseConnection.exec_params(sql, sql_params)
    # Returns nothing (only deletes the record)
    return nil
   end
end