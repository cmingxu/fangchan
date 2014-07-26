# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#


client = Client.new :name => "西安xx房地产公司", :tel => "010-12344321"
client.apps.build :name => "项目名称", :hushu => 100, :mianji => 100 * 100, :junjia => 8000
client.users.build :login => "admin", :password => "abcdef", :password_confirmation => "abcdef", :email => "test@test.com"

client.save
