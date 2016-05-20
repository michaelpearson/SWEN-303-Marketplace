class WelcomeController < ApplicationController

  def index
    stock   = Stock.all
    @featured = stock.select {|s| s.photos.length > 1 }.first
  end
end
