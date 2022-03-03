require 'sinatra/base'
require 'sinatra/reloader'
require 'webrick'
# require_relative './lib/chitter'
require './database_connection_setup'
require_relative './lib/user'
require './lib/peeps'

class Chitter < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @peeps = Peeps.view_peeps
    @pe = Peeps.create_peep(peep: params[:peep])
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up_details' do
    if User.unique_username(params[:username]) == true
      User.create_user(params[:username], params[:password], params[:email], params[:phone_number])
      redirect '/login'
    else
      redirect '/sign_up'
    end
  end

  get '/login' do
    erb :login
  end

  post '/user_details' do
    session[:username] = params[:username]
    session[:password] = params[:password]
    redirect '/home'
  end

  get '/home' do
    if User.valid(session[:username], session[:password])
      session[:user_id] = User.user_id(username: session[:username])
      @peeps = Peeps.view_peeps
      @pe = Peeps.create_peep(peep: params[:peep])
      @username = session[:username]
      # p @peep
      
      erb :home
    else
      redirect '/login'
    end    
  end

  post '/peep_created' do
    @peeps = Peeps.view_peeps
      @pe = Peeps.create_peep(peep: params[:peep])
      @peep = params['peep']
      erb :'/peep_created'    
  end

end