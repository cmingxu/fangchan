# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  attr_accessor :password
  validates :password, :presence => true
  validates :login, :presence => true
  validates :login, :format => { :with => /(\w|\d)+/, :message => "登陆名只能是数字或者字母" }
  validates :password, :length => { :in => 6..20, :message => "密码只要要6位以上"}
  validates :email, :format => { :with => EMAIL_REG }, :allow_blank => true

  def password_valid?(pass)
    self.encrypted_password = self.class.encrypt_password(pass)
  end

  def password=(pass)
    self.encrypted_password = self.class.encrypt_password(pass)
  end

  def self.encrypt_password(pass)
    Base64.encode64(pass).reverse
  end
end
