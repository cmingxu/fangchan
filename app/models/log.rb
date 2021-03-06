# -*- encoding : utf-8 -*-
class Log < ActiveRecord::Base
  validates :xiaoding, :presence => {:message => "小定数不能空"}
  validates :tuiding, :presence => {:message => "退订数不能空"}
  validates :qianyue, :presence => {:message => "签约数不能空"}
  validates :qianyue_mianji, :presence => {:message => "面积不能空"}
  validates :qianyue_jine, :presence => {:message => "金额不能空"}

  validates :xiaoding, :numericality => {:message => "小定数需是大于0的整数", :greater_than => 0}
  validates :tuiding, :numericality => {:message => "退订数需是大于0的整数", :greater_than => 0}
  validates :qianyue, :numericality => {:message => "签约数需是大于0的整数", :greater_than => 0}
  validates :qianyue_mianji, :numericality => {:message => "签约面积需是大于0的整数", :greater_than => 0}
  validates :qianyue_jine, :numericality => {:message => "签约金额需是大于0的整数", :greater_than => 0}

  belongs_to :user
  belongs_to :app
  belongs_to :client
  has_one :message

  def avg_jine
    (self.qianyue_jine / self.qianyue_mianji.to_f).to_i
  end

  def message_content
   "领导， 今日小定#{self.xiaoding}套， 签约#{self.qianyue}套， 销售面积#{self.qianyue_mianji}平米，销售额#{self.qianyue_jine.in_human_readable_money}."
  end
end
