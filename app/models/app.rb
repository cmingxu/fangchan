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

  def remain_jine
  end

  def remain_hushu
  end

  def remain_mianji
  end
end
