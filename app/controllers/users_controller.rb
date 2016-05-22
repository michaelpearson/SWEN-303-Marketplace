class UsersController < ApplicationController
  include SessionsHelper
  include ApplicationHelper
  include NotificationsHelper
  protect_from_forgery except: :register_push
  before_action :set_user, only: [:show, :edit, :edit_password, :update]

  def index
  end

  def new
    @user = User.new
  end

  def edit
  end

  def edit_password
  end

  def create
    user_data = params[:user]
    existing_user = User.find_by(username: user_data[:username])
    if existing_user
      @alert = {
        type: "warning",
        message: "Username already exists."
      }
      @user = User.new
      render 'new'
    else
      user = User.create(
        realname: user_data[:realname],
        username: user_data[:username],
        password: user_data[:password]
      )

      log_in(user)
      redirect_to myrafflr_path
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to myrafflr_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def history
    query_type = params[:type]
    case query_type
    when "items_raffling"
      @text = "Items I'm Raffling"
      @results = current_user.current_stock.reverse
    when "items_sold"
      @text = "Item's I've sold"
      @results = current_user.sold_stock.reverse
    when "items_bid_current"
      @text = "Unfinnished Items I've Bid On"
      @results = current_user.current_bids.reverse
    when "items_bid_past"
      @text = "Finnished Items I've Bid On"
      @results = current_user.past_bids.reverse
    when "items_won"
      @text = "Items Won"
      @results = current_user.items_won.reverse
    when "items_all_raffeld"
      @text = "All Items raffled"
      @results = current_user.stock.reverse
    when "items_near_completion"
      @text = "About to Finish"
      @results = Stock.near_completion
    when "items_new"
      @text = "Recent Raffles"
      @results = Stock.all.order('updated_at DESC')
    when "notifications"
      @text = "Notifications"
      @results = current_user.notifications.reverse
      update_notifications
    else
      @results = current_user.uniq_bids
    end
  end

  def show
    @notifications = Notification.for_user(current_user).unseen if logged_in?
  end

  def register_push
    puts params
    if logged_in?
      NotificationSetting.create(url: params[:url], user: current_user)
      cookies[:user_id] = { :value => current_user.id, :expires => 9999999.hour.from_now }
      render json: {sucess: true}
    else
      render json: {sucess: false}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.

  def set_user
    require_logged_in
    @user = User.find_by(id: session[:user_id])
  end

  def update_notifications
    seen_notifications(current_user)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:username, :realname, :password)
  end
end
