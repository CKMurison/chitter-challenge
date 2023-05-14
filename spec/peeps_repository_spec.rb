require 'peeps_repository'

RSpec.describe PeepsRepository do

  def reset_users_table
    seed_sql = File.read('spec/seeds_users.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
    connection.exec(seed_sql)
  end
  
  def reset_peeps_table
    seed_sql = File.read('spec/seeds_peeps.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
    connection.exec(seed_sql)
  end
  
  before(:each) do 
    reset_users_table
    reset_peeps_table
  end

  
  it 'gets all items from the table ' do

    repo = PeepsRepository.new

    peep = repo.all
    expect(peep.length).to eq(2)
    expect(peep.first.user_id).to eq('1')
    expect(peep.first.content).to eq 'Take a look at that peep!'
  end
  
  context 'It find a certian peep' do
    it 'finds peep 1' do
      repo = PeepsRepository.new
      peep = repo.find(1)
      expect(peep.time_posted).to eq '2023-11-23 12:45:00'
      expect(peep.content).to eq 'Take a look at that peep!'
      expect(peep.user_id).to eq '1'
    end

    it 'finds peep 2' do 
      repo = PeepsRepository.new
      peep = repo.find(2)
      expect(peep.time_posted).to eq '2023-12-23 19:14:00'
      expect(peep.content).to eq 'Just ate a croissant'
      expect(peep.user_id).to eq '2'
    end
  end

  it 'creates a new item in the table' do

    repo = PeepsRepository.new

    new_peep = Peep.new
    new_peep.time_posted = '2022-11-23 12:45:00'
    new_peep.content = 'I love the gim'
    new_peep.user_id = '3'

    repo.create(new_peep)

    peeps = repo.all
    last_peep = peeps.last

    expect(last_peep.time_posted).to eq '2022-11-23 12:45:00'
    expect(last_peep.content).to eq 'I love the gim'
    expect(last_peep.user_id).to eq '3'
  end

  it 'deletes an item from the table' do
    repo = PeepsRepository.new

    id_to_delete = 1

    repo.delete(id_to_delete)

    all_peeps = repo.all
    expect(all_peeps.length).to eq 1
    expect(all_peeps.first.user_id).to eq '2'
    expect(all_peeps.first.content).to eq 'Just ate a croissant'
  end
end
