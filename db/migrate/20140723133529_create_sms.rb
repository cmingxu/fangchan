class CreateSms < ActiveRecord::Migration
  def change
    create_table :sms do |t|
      t.text :content
      t.text :mobile_num
      t.integer :user_id
      t.integer :log_id
      t.integer :app_id

      t.timestamps
    end
  end
end
