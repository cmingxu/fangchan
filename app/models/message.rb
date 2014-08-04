# -*- encoding : utf-8 -*-
class Message < ActiveRecord::Base
  validates :content, :presence => { :message => "短信内容不能空" }
  validates :mobile_num, :presence => { :message => "手机号码不能空" }
  validate :mobile_num_valid

  belongs_to :app
  belongs_to :user
  belongs_to :log
  belongs_to :client

  def mobile_num_valid
    return unless self.mobile_num.present?
    self.mobile_num.split(",").each do |m|
      self.errors.add(:base, "手机号码格式不正确") if !(m.strip =~ MOBILE_NUM_REG)
    end
  end
end
