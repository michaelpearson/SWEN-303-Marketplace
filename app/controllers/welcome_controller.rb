class WelcomeController < ApplicationController

  def index
    stock   = Stock.all
    @recent = stock.reverse.take(5)
    @close  = stock.sort_by { |s| s.price.to_f / s.bid_count.to_f }
      .reject(&:met_required_bids?).first(5)
  end
end
