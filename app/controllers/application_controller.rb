class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def current_tab
    @current_tab || request.path
  end

  def tab_class(link)
    current_tab == link ? "active" : ""
  end

  helper_method :current_user, :tab_class
end

