# require "spec_helper"
# require "rack/test"
# require_relative '../../app'

# describe Application do
#   # This is so we can use rack-test helper methods.
#   include Rack::Test::Methods

#   # We need to declare the `app` value by instantiating the Application
#   # class so our tests work.
#   let(:app) { Application.new }

#   def reset_all_table
#     seed_sql = File.read('chitter_table.sql')
#     connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
#     connection.exec(seed_sql)
#   end
  
#   before(:each) do 
#     reset_all_table
#   end

#   context '/' do
#     it "returns the index page" do
#       response = get('/')
#       expect(response.status).to eq(200)
#       expect(response.body).to include('<h1>Welcome to CHITTER!</h1>')
#     end
#   end
# end