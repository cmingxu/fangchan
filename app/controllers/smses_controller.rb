# -*- encoding : utf-8 -*-
class SmsesController < RestrictedController
  before_filter do
    @breadcrumb = "发送短信"
  end

  def new
  end
end
