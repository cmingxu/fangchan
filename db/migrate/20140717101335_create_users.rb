# -*- encoding : utf-8 -*-
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :encrypted_password
      t.datetime :last_login_at
      t.string :last_login_ip
      t.string :role
      t.string :login
      t.string :application_id

      t.timestamps
    end
  end
end
