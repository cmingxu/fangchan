# -*- encoding : utf-8 -*-
class UsersController < RestrictedController
  def create
    @user = User.new(user_params)

    respond_to do |format|
      format.html do
        @user.client = current_client
        if @user.save
          notice = "#{@user.name}添加成功"
        else
          notice = @user.errors.values.flatten.join(", ")
        end
        redirect_to app_settings_path(:setting_tag => "user"), :notice => notice
      end
    end
  end


  def change_pass
    notice = ""
    if !current_user.password_valid?(user_params[:pass])
      notice = "密码不正确"
    elsif user_params[:new_pass].blank? || user_params[:new_pass_confirmation].blank?
      notice = "新密码不能空"
    elsif user_params[:new_pass] != user_params[:new_pass_confirmation]
      notice = "密码不一致"
    end

    if notice.blank?
      current_user.password = user_params[:new_pass]
      current_user.save
    end

    redirect_to settings_path, :notice => notice
  end

  def change_name
    notice = ""
    if user_params[:name].blank?
      notice = "姓名不能空"
    end

    if notice.blank?
      current_user.update_column :name, user_params[:name]
    end

    redirect_to settings_path, :notice => notice 
  end


  def user_params
    params.require(:user).permit(:login, :password, :password_confirmation, :name, :tel, :pass, :new_pass, :new_pass_confirmation)
  end
end
