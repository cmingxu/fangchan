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



  def user_params
    params.require(:user).permit(:login, :password, :password_confirmation, :name, :tel)
  end
end
