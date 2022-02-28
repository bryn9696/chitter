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

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up_details' do
    redirect '/login'
  end

end