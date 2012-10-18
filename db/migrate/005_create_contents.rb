# -*- encoding : utf-8 -*-
class CreateContents < ActiveRecord::Migration
  def self.up
    create_table :contents do |t|
      t.string   :name
      t.integer  :resource_id
      t.string   :resource_type
      t.integer  :parent_id
      t.string   :navlabel
      t.boolean  :active
      t.boolean  :admin
      t.integer  :position
      t.string   :controller_name
      t.string   :category, :default => "Admin"

      t.timestamps
    end
  end

  def self.down
    drop_table :contents
  end
end
