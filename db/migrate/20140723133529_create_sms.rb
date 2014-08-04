# -*- encoding : utf-8 -*-
class CreateSms < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.text :mobile_num
      t.integer :user_id
      t.integer :log_id
      t.integer :app_id
      t.integer :client_id
      t.boolean :sent
    

      t.timestamps
    end
  end
end
