# -*- encoding : utf-8 -*-
class MessagesController < RestrictedController
  before_filter do
    @breadcrumb = "发送短信"
  end

  def new
  end

  def create
    @message = Message.new message_params
    @message.user = current_user
    @message.client =  current_client
    @message.log = current_log
    @message.app  = current_app
    if @message.save
      notice = "短信发送成功， 5分钟内可送达。"
    else
      notice = @message.errors.full_messages.first
    end

    redirect_to new_message_path, :notice => notice
  end

  def message_params
    params.require(:message).permit(:content, :mobile_num)
  end
end
