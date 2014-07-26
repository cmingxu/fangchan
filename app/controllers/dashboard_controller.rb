# -*- encoding : utf-8 -*-
class DashboardController < RestrictedController
  before_filter do
    @breadcrumb = "工作台"
  end
 
  def index
  end
end
