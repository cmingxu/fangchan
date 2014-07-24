# -*- encoding : utf-8 -*-
class Log < ActiveRecord::Base
  belongs_to :user
  belongs_to :app
  belongs_to :client
  has_one :sms
end
