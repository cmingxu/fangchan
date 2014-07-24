# -*- encoding : utf-8 -*-
class DashboardController < RestrictedController
  skip_before_filter :login_required

  before_filter do
    @breadcrumb = "工作台"
  end
 
  def index
  end
end
