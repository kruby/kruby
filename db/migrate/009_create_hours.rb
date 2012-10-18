# -*- encoding : utf-8 -*-
class CreateHours < ActiveRecord::Migration
  def self.up
    create_table :hours do |t|
      t.string :user
      t.string :description
      t.integer :number
      t.date :date

      t.timestamps
    end
  end

  def self.down
    drop_table :hours
  end
end
