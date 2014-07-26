# -*- encoding : utf-8 -*-
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

  def current_client
    @client ||= current_user.client
  end


  def current_app
    return @current_app if @current_app
    current_client.apps.find_by_id(session[:app_id]) || current_client.apps.first
  end

  helper_method :current_user, :tab_class, :current_client, :current_app
end

