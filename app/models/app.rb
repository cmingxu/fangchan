# -*- encoding : utf-8 -*-
class App < ActiveRecord::Base
  validates :name, :presence => {:message => "项目名称不能空"}
  validates :hushu, :presence => {:message => "户数不能空"}
  validates :mianji, :presence => {:message => "面积不能空"}
  validates :junjia, :presence => {:message => "均价不能空"}
  validates :hushu, :numericality => {:message => "户数需是大于0的整数", :greater_than => 0}
  validates :mianji, :numericality => {:message => "数需是大于0的整数", :greater_than => 0}
  validates :junjia, :numericality => {:message => "均价需是大于0的整数", :greater_than => 0}

  has_many :logs
  has_many :users
  belongs_to :client

  def zongjia
    self.mianji * self.junjia 
  end

  def latest_log
    self.logs.last
  end

  def mianji_sold
    self.logs.sum(:qianyue_mianji)
  end

  def hushu_sold
    self.logs.sum(:qianyue)
  end

  def money_sold
    self.logs.sum(:qianyue_jine)
  end

  def remain_jine
    self.zongjia - self.money_sold
  end

  def remain_hushu
    self.hushu - self.hushu_sold
  end

  def remain_mianji
    self.mianji - self.mianji_sold
  end


  def avg_jine
    (self.money_sold / self.mianji_sold.to_f).to_i
  end

  def remain_avg_jine
    (self.remain_jine / self.remain_mianji.to_f).to_i
  end
end
