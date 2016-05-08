class UsersController < ApplicationController
  include SessionsHelper
  def index
  end

  def new
    @user = User.new
  end

  def create
    user_data = params[:user]
    existing_user = User.find_by(username: user_data[:username])
    if existing_user
      @alert = {
        type: "warning",
        message: "Username already exists."
      }
      @user = User.new
      render 'new'
    else
      user = User.create(
        realname: user_data[:realname],
        username: user_data[:username],
        password: user_data[:password]
      )

      log_in(user)
      redirect_to user_path(user)
    end
  end

  def show
    @user = User.find(session[:user_id])
  end
end
