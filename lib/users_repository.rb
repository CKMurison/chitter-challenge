require_relative 'users'

class UsersRepository
  def all
    sql = 'SELECT id, username, password, email, peep_id FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])

    users = []
    result_set.each do |record|
    user = User.new
    user.id = record['id']
    user.username = record['username']
    user.password = record['password']
    user.email = record['email']
    user.peep_id = record['peep_id']

    users << user
    end
  return users
  end
end