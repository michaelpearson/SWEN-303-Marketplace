class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def create
    user_data = params[:user]
    existing_user = User.where(user_data).take
    if existing_user
      redirect_to user_path(existing_user)
    end
  end

  def show
    user_data = params[:user]
    @user = User.where(user_data).take
  end
end
