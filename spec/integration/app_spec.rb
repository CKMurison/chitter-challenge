# require "spec_helper"
# require "rack/test"
# require_relative '../../app'

# describe Application do 
#  # This is so we can use rack-test helper methods.
#  include Rack::Test::Methods

#  # We need to declare the `app` value by instantiating the Application
#  # class so our tests work.
#  let(:app) { Application.new }

# def reset_users_table
#   seed_sql = File.read('spec/seeds_users.sql')
#   connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
#   connection.exec(seed_sql)
# end

# def reset_peeps_table
#   seed_sql = File.read('spec/seeds_peeps.sql')
#   connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
#   connection.exec(seed_sql)
# end

# before(:each) do 
#   reset_users_table
#   reset_peeps_table
# end

# end