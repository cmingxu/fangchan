# -*- encoding : utf-8 -*-
class SessionController < ApplicationController
  def signin
    if request.get?
      @user = User.new
    else
    end
  end

  def signup
    @user = User.new
  end
end
