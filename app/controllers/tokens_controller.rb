class TokensController < ApplicationController
  protect_from_forgery except: :create
  def new
    puts "Hit TOKEN CONTROLLER#NEW"
  end

  def create
    if params[:redemption_code].length == 4
      user = User.find_by(id: params[:user_id])
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
