class UsersController < ApplicationController
  # LOG IN
  get '/login' do
    if is_logged_in?
      flash[:message] = 'You were already logged in.'
      redirect '/dashboard'
    else
      haml :'user/login'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/dashboard'
    else
      flash[:message] = 'Your username or password were not correct. Please try again.'
      redirect '/login'
    end
  end

  # SIGN UP

  get '/sign_up' do
    if is_logged_in?
      flash[:message] = 'You were already logged in.'
    else
      haml :'user/create'
    end
  end

  post '/sign_up' do
    if is_logged_in?
      flash[:message] = 'You were already logged in.'
      redirect to '/login'
    elsif params[:username].empty? || params[:password].empty?
      flash[:message] = 'In order to sign up for account, you must have both a username & a password. Please try again.'
      redirect to '/sign_up'
    else
      @user = User.create(username: params[:username], password: params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to '/dashboard'
    end
  end

  # LOG OUT

  get '/log_out' do
    if is_logged_in?
      session.clear
      flash[:message] = 'You have been logged out of your account.'
      redirect '/login'
    else
      redirect '/'
    end
  end
end
