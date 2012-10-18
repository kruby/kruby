# -*- encoding : utf-8 -*-
class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string   :title
      t.text     :body
      t.string   :author
      t.integer  :priority,   :default => 1
      t.integer  :parent_id
      t.integer  :user_id

      t.timestamps
      
      
    end
  end

  def self.down
    drop_table :posts
  end
end
