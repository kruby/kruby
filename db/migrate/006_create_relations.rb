# -*- encoding : utf-8 -*-
class CreateRelations < ActiveRecord::Migration
  def self.up
    create_table :relations do |t|
      t.string :company
      t.string :address
      t.string :postno
      t.string :city
      t.text :log
      t.string :category
      t.string :responsible

      t.timestamps
    end
  end

  def self.down
    drop_table :relations
  end
end
