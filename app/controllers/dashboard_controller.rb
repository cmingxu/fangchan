# -*- encoding : utf-8 -*-
class DashboardController < RestrictedController
  skip_before_filter :login_required
  def index
  end
end
