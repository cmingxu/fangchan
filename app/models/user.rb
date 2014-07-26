# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  attr_accessor :password, :password_confirmation
  validates :password, :presence => { :message => "密码不能空" }
  validates :login, :presence => { :message => "登陆名不能空" }
  validates :login, :format => { :with => /(\w|\d)+/, :message => "登陆名只能是数字或者字母" }
  validates :password, :length => { :in => 6..20, :message => "密码只要要6位以上"}
  validate :password_confirmation_same_as_password
  validates :email, :format => { :with => EMAIL_REG }, :allow_blank => true
  validates :email, :uniqueness => { :message => "Email已存在， 请换一个Email地址" }
  validates :login, :uniqueness => { :message => "登陆名已存在， 请更换" }


  has_many :logs
  belongs_to :app
  belongs_to :client
  before_save :handle_password_change

  def password_valid?(pass)
    self.encrypted_password == self.class.encrypt_password(pass)
  end


  private
  def handle_password_change
    self.encrypted_password = self.class.encrypt_password(self.password)
  end

  def password_confirmation_same_as_password
    self.errors.add(:base, "密码验证和密码不一致") if\
    self.password_confirmation.present? && self.password != self.password_confirmation
  end

  def self.encrypt_password(pass)
    Base64.encode64(pass).reverse
  end
end
