# -*- encoding : utf-8 -*-
class MessagesController < RestrictedController
  skip_before_filter :login_required
  before_filter do
    @breadcrumb = "发送短信"
  end

  def index
    Message.where(["created_at > ? AND sent = 0", Time.at(message_params[:last_sync])]).limit(100).order("created_at")
  end

  def new
  end

  def create
    @message = Message.new message_params
    @message.user = current_user
    @message.client =  current_client
    @message.log = current_log
    @message.app  = current_app
    @message.sent = false
    if @message.save
      notice = "短信发送成功， 5分钟内可送达。"
    else
      notice = @message.errors.full_messages.first
    end

    redirect_to new_message_path, :notice => notice
  end

  def mark_sent
    Message.find(params[:id]).sent!
    head :ok
  end

  def message_params
    params.require(:message).permit(:content, :mobile_num, :last_sync)
  end
end
