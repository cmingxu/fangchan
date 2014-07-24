# -*- encoding : utf-8 -*-
class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :tel

      t.timestamps
    end
  end
end
