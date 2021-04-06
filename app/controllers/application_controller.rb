require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    @user = User.find_by_username(params[:username])
    if @user
      session[:user_id] = @user.id
      @session = session
      redirect to "/account"
    else
      erb :error 
    end

  end

  get '/account' do
    # @user = User.find_by_id(@session[:user_id])
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user
    end
    erb :account
  end

  get '/logout' do
    session.clear
  end


end








