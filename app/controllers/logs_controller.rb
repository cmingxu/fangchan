# -*- encoding : utf-8 -*-
class LogsController < RestrictedController
  before_filter do
    @breadcrumb = "新建报表"
  end

  def new
    @log = Log.new
  end

  def create
    @log = Log.new(log_params)
    @log.app = current_app
    @log.client = current_client
    @log.user = current_user

    respond_to do |format|
      format.html do
        if @log.save
          redirect_to dashboard_path
        else
          render :new
        end
      end
    end
  end


  def log_params
    params.require(:log).permit(:tuiding, :qianyue, :qianyue_mianji, :qianyue_jine, :xiaoding)
  end
end
