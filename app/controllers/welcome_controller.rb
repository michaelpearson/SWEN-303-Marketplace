class WelcomeController < ApplicationController

  def index
    stock =  Stock.all
    @recent = stock.reverse.take(5)
    @close = stock.reject { |s| s.bid_count < s.price * 0.9 }
  end

end
