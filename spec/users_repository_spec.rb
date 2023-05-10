require 'users_repository'

RSpec.describe UsersRepository do

def reset_users_table
  seed_sql = File.read('spec/seeds_users.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

  before(:each) do 
    reset_users_table
  end

  it 'gets all items from the table ' do

    repo = UsersRepository.new

    user = repo.all
    expect(user.length).to eq(2)
    expect(user.first.id).to eq('1')
    expect(user.first.email).to eq 'bob@email'
  end
end
