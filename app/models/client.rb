# -*- encoding : utf-8 -*-
class Client < ActiveRecord::Base
  has_many :app
  has_many :users
end
