# -*- encoding : utf-8 -*-
class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string   :name
      t.string   :headline
      t.text     :description
      t.string   :kind
      t.integer  :cost_price,        :limit => 10, :precision => 10, :scale => 0
      t.integer  :sales_price,       :limit => 10, :precision => 10, :scale => 0
      t.integer  :purchase_quantity
      t.integer  :stock_in
      t.integer  :stock_out
      t.integer  :stock
      t.integer  :active
      t.string   :image
      t.string   :title
      t.string   :image_class

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
