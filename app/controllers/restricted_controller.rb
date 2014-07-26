# -*- encoding : utf-8 -*-
class RestrictedController < ApplicationController
  layout "restricted"
  before_filter :login_required

  def login_required
    unless current_user
      redirect_to root_path, notice: "登陆后访问"
      return false
    end
  end
end
