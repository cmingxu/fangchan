# -*- encoding : utf-8 -*-
class Client < ActiveRecord::Base
  has_many :apps
  has_many :users
end
