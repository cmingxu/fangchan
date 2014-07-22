class CreateApplications < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.integer :hushu
      t.integer :mianji
      t.integer :junjia

      t.timestamps
    end
  end
end
