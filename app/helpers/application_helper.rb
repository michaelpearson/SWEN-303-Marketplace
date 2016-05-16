module ApplicationHelper
  def logged_in?
    session[:user_id] != nil
  end

  def require_logged_in
    redirect_to login_path(next_url: url_for(action: params[:action], controller: params[:controller])) if !logged_in?
  end
end
