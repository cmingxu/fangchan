# -*- encoding : utf-8 -*-
class App < ActiveRecord::Base
  has_many :logs
  has_many :users
  belongs_to :client

  scope :today_log, lambda {  where(["log_date = ?", Date.today]).first }
  scope :latest_log, lambda {  order("log_date DESC").limit(1) }


  def zongjia
    self.mianji * self.junjia 
  end
end
