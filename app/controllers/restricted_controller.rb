# -*- encoding : utf-8 -*-
class RestrictedController < ApplicationController
  before_filter :login_required
  layout "restricted"

  def login_required
    redirect_to root_path, notice: "登陆后访问"
  end
end
