# -*- encoding : utf-8 -*-
class SessionController < ApplicationController
  def signin
    if request.get?
      @user = User.new
    else
      @errors = []
      @user = User.find_by_login(params[:user][:login])
      @errors << "用户不存在" if @user.nil?
      @errors << "密码不正确" if (@user && !@user.password_valid?(params[:user][:password]))
      if @errors.blank?
        session[:user_id] = @user.id
        redirect_to dashboard_path and return
      end
    end
  end

  def signup
    @user = User.new request.get? ? {} : user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path and return
    end
  end

  def sign_out
    session[:user_id] = nil
    redirect_to root_path and return
  end

  def user_params
    params.require(:user).permit(:login, :password, :password_confirmation)
  end
end
