class UsersController < ApplicationController
  def index
  end

  def create
  end

  def show
    @user = User.find(session[:user_id])
  end
end
