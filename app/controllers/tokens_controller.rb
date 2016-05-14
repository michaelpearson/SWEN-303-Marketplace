class TokensController < ApplicationController
  include SessionsHelper
  protect_from_forgery except: :create
  def new
  end

  def create
    #TODO login redirection when the branch `stock_rework` is in master
    if params[:redemption_code].length == 4
      user = current_user
      Transaction.create!(
        user_id: user.id,
        stock: Stock.new,
        kind: "TOKEN"
      )

      user.token_count += 10
      user.save
    else
      @alert = {
        type: "warning",
        message: "Invalid redemption code."
      }
      render 'new'
    end
  end
end
