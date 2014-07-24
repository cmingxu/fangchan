# -*- encoding : utf-8 -*-
class Sms < ActiveRecord::Base
  belongs_to :app
  belongs_to :user
  belongs_to :log
end
