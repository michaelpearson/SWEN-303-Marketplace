class StocksController < ApplicationController
  include SessionsHelper
  before_action :set_stock, only: [:show, :edit, :update, :destroy]

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
      redirect_to @stock, notice: 'Stock was successfully updated.'
    else
      render :edit
    end
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
    params.require(:stock).permit(:label, :price, :quantity)
  end
end
