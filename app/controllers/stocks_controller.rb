class StocksController < ApplicationController
  include SessionsHelper
  include ApplicationHelper
  before_action :set_stock, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :bid

  # GET /stocks
  def index
    @stocks = Stock.all
  end

  # GET /stocks/1
  def show
  end

  # GET /stocks/new
  def new
    @stock = Stock.new
    @stock.photos.build
  end

  # GET /stocks/1/edit
  def edit
    unless logged_in @stock.owner
      redirect_to stock_url, :alert => "Access denied."
    end
  end

  # POST /stocks
  def create
    @stock = Stock.new(stock_params)
    @stock.owner = current_user
    if @stock.save
      @stock.photos = @stock.photos || []
      if params[:photos]
        params[:photos][:image].each do |photo|
          @stock.photos.create!(image: photo)
        end
      end
      redirect_to @stock, notice: 'Stock was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /stocks/1
  def update
    unless logged_in @stock.owner
      redirect_to stocks_url, :alert => "Access denied."
    end

    if @stock.update(stock_params)
      @stock.photos = @stock.photos || []
      if params[:photos]
        params[:photos][:image].each do |photo|
          p = Photo.new
          p.image = photo
          p.save
          @stock.photos << p
        end
      end
      redirect_to @stock, notice: 'Stock was successfully updated.'
    else
      render :edit
    end
  end

  def bid
    stock = Stock.find_by(id: params[:id])
    user = current_user
    if logged_in? && stock.has_not_met_required_bids? && user.can_bid?
      transaction = Transaction.create(
        user: user,
        stock: stock,
        kind: "BID"
      )

      user.token_count -= 1
      user.save

      if stock.met_required_bids?
        NotifyUsersOfStockCompletion.new(stock, stock.participating_users.sample).call
      end
      #TODO what do we want to do after we have created the bid? Where do we direct?
      render json: {
        sucess: true,
        current_value: stock.bid_count,
        user_value: stock.bids_from(user)
      }
    else

      render json: {
        sucess: false,
        current_value: stock.bid_count,
        user_value: stock.bids_from(user)
      }
    end
    #TODO some form of notification would be nice, to tell the user they need to be logged in. Maybe handle in front?
  end

  # DELETE /stocks/1
  def destroy
    unless logged_in @stock.owner
      redirect_to stock_url, :alert => "Access denied."
    end
    @stock.destroy
    redirect_to stocks_url, notice: 'Stock was successfully destroyed.'
  end

  private
  def set_stock
    @stock = Stock.find(params[:id])
  end

  def stock_params
    params.require(:stock).permit(:label, :price, photo_attributes: [:image])
  end
end
