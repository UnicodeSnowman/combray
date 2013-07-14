class SessionsController < ApplicationController

  def index

  end

  def new

  end

  def create
    user = User.find_by_email(params[:login][:email])

    if user && user.authenticate(params[:login][:password])
      session[:user_id] = user.id
      flash[:notice] = 'logged in successfully'

      puts 'session user id'
      puts session[:user_id]

      redirect_to admin_path
    else
      flash[:error] = 'login failed'
      render :new
    end
  end

end
