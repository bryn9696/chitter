require 'sinatra/base'
require 'sinatra/reloader'
require 'webrick'
# require_relative './lib/chitter'
# require_relative './lib/user'

class Chitter < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

end