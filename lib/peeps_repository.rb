require_relative 'peeps'

class PeepsRepository
  def all
    sql = 'SELECT time_posted, content, user_id FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])

    peeps = []
    result_set.each do |record|
      peep = Peep.new
      peep.time_posted = record['time_posted']
      peep.content = record['content']
      peep.user_id = record['user_id']
  
      peeps << peep
    end
    return peeps
  end

  def find(id)
    sql = 'SELECT time_posted, content, user_id FROM peeps WHERE id = $1;'
    sql_params = [id]
    result_set = DatabaseConnection.exec_params(sql, sql_params)

    record = result_set[0]

    peep = Peep.new
    peep.time_posted = record['time_posted']
    peep.content = record['content']
    peep.user_id = record['user_id']

    return peep
  end

  def create(peeps)
    # Executes SQL query
    sql = 'INSERT INTO peeps (time_posted, content, user_id) VALUES($1, $2, $3);'
    sql_params = [peeps.time_posted, peeps.content, peeps.user_id]
    DatabaseConnection.exec_params(sql, sql_params)
    # Doesn't need to return anything (only creates a record)
    return nil
  end

  def delete(id)
   # Executes the SQL
    sql = 'DELETE FROM peeps WHERE id = $1;'
    sql_params = [id]
    DatabaseConnection.exec_params(sql, sql_params)
   # Returns nothing (only deletes the record)
    return nil
  end
end
