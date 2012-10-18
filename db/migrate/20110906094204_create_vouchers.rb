# -*- encoding : utf-8 -*-
class CreateVouchers < ActiveRecord::Migration
  def self.up
    create_table :vouchers do |t|
      t.string :description
      t.integer :number
      t.integer :relation_id
      t.date :date
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :vouchers
  end
end
