require 'sinatra/flash'
require 'haml'

class ApplicationController < Sinatra::Base
  # enable session
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'owner'
    register Sinatra::Flash
  end

  # Homepage
  get '/' do
    haml :index
  end

  def is_logged_in?
    !!session[:user_id]
 end

 def current_user
   @user = User.find(session[:user_id])
 end
end
