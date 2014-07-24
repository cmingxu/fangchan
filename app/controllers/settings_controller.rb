# -*- encoding : utf-8 -*-
class SettingsController < RestrictedController
  before_filter do
    @breadcrumb = "个人设置"
  end

  def index
  end
end
