class SessionsController < ApplicationController
  include SessionsHelper
  def new
  end

  def create
    user_data = params[:session]
    existing_user = User.find_by(username: user_data[:username])

    if existing_user && existing_user.valid_password?(user_data[:password])
      @user = existing_user
      log_in(existing_user)
      redirect_to user_path(existing_user)
    else
      @alert = {
        type: "warning",
        message: "Incorrect username or password"
      }
      render 'new'
    end
  end

  def destroy
    log_out
    @alert = {
      type: "success",
      message: "Successfully logged out"
    }
    render 'new'
  end
end
