# -*- encoding : utf-8 -*-
class CreateApplications < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.integer :hushu
      t.integer :mianji
      t.integer :junjia
      t.integer :client_id

      t.timestamps
    end
  end
end
