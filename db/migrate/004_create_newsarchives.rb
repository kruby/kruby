# -*- encoding : utf-8 -*-
class CreateNewsarchives < ActiveRecord::Migration
  def self.up
    create_table :newsarchives do |t|
      t.string   :title
      t.text     :text
      t.string   :author
      t.string   :link
      t.boolean  :active
      t.string   :name
      t.string   :image

      t.timestamps
    end
  end

  def self.down
    drop_table :newsarchives
  end
end
