require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/users_repository'
require_relative 'lib/peeps_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('chitter_database')

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    return erb(:index)
  end

  get '/peeps' do
    repo = PeepsRepository.new
    @peeps = repo.all
    return erb(:home)
  end
end
