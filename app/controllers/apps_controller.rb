# -*- encoding : utf-8 -*-
class AppsController < RestrictedController
  def settings
  end

  def create
    @app = App.new(app_params)
    @app.client = current_client 
    respond_to do |format|
      format.html do
        if @app.save
          notice = "#{@app.name}添加成功"
        else
          notice = @app.errors.values.flatten.join(", ")
        end
        redirect_to app_settings_path(:setting_tag => "app"), :notice => notice
      end
    end
  end

  def switch
    session[:app_id] = params[:id]
    redirect_to dashboard_path
  end


  def app_params
    params.require(:app).permit(:name, :hushu, :mianji, :junjia)
  end
end
