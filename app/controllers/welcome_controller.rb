class WelcomeController < ApplicationController

  def index
    stock =  Stock.all
    @recent = stock.reverse.take(5)
    @close = stock.reject { |s| s.bid_count < s.price * 0.5 }
      .reject(&:met_required_bids?)
      .sort {|a,b| b.percentage_complete <=> a.percentage_complete }
  end

end
