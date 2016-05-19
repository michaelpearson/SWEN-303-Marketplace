module ApplicationHelper
  def logged_in?
    session[:user_id] != nil
  end

  def require_logged_in
    redirect_to login_path(next_url: url_for(action: params[:action], controller: params[:controller])) unless logged_in?
  end

  def options_for_stock_category(selected = "All")
    Stock.categories.inject("<option>All</option>") do |options, category|
      selected_html = selected == category ? " selected=\"#{category}\"" : ""
      "#{options} <option#{selected_html}>#{category}</option>"
    end.html_safe
  end
end
