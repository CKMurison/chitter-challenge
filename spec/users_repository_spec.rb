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
    expect(user.length).to eq(3)
    expect(user.first.id).to eq('1')
    expect(user.first.email).to eq 'bob@email'
  end
  
  context 'It find a certian user' do
    it 'finds user 1' do
      repo = UsersRepository.new
      user = repo.find(1)
      expect(user.username).to eq 'L4ZERH4WK'
      expect(user.password).to eq '12345'
      expect(user.email).to eq 'bob@email'
    end

    it 'finds user 2' do 
      repo = UsersRepository.new
      user = repo.find(2)
      expect(user.username).to eq 'Aphex'
      expect(user.password).to eq '54321'
    end
  end

  it 'creates a new item in the table' do

    repo = UsersRepository.new

    new_user = User.new
    new_user.username = 'Big Slime'
    new_user.password = 'Eight'
    new_user.email = 'bazza@yahoo'

    repo.create(new_user)

    users = repo.all
    last_user = users.last

    expect(last_user.username).to eq 'Big Slime'
    expect(last_user.password).to eq 'Eight'
    expect(last_user.email).to eq 'bazza@yahoo'
  end

  it 'deletes an item from the table' do
    repo = UsersRepository.new

    id_to_delete = 1

    repo.delete(id_to_delete)

    all_users = repo.all
    expect(all_users.length).to eq 2
    expect(all_users.first.id).to eq '2'
    expect(all_users.first.username).to eq 'Aphex'
  end
end
