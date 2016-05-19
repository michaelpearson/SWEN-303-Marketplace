class TokensController < ApplicationController
  include SessionsHelper
  include ApplicationHelper

  before_action :require_user, only: [:new, :create]

  protect_from_forgery except: :create

  def new
  end

  def create
    if params[:redemption_code].length == 4
      user = current_user
      Transaction.create!(
        user_id: user.id,
        stock: Stock.new,
        kind: "TOKEN"
      )

      user.token_count += 10
      user.save
      @alert = {
        type: "success",
        message: "10 Tokens added to your account!"
      }
      render 'new'
    else
      @alert = {
        type: "warning",
        message: "Invalid redemption code."
      }
      render 'new'
    end
  end

  private

  def require_user
    require_logged_in
  end
end
