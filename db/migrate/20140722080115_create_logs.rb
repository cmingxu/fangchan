class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.date :log_date
      t.integer :tuiding
      t.integer :qianyue
      t.integer :qianyue_mianji
      t.integer :qianyue_jine
      t.integer :user_id
      t.integer :application_id

      t.timestamps
    end
  end
end
