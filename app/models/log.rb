class Log < ActiveRecord::Base
  belongs_to :user
  belongs_to :app
  has_one :sms
end
