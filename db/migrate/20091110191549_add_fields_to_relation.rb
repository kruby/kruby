# -*- encoding : utf-8 -*-
class AddFieldsToRelation < ActiveRecord::Migration
  def self.up
    add_column :relations, :phone, :text
    add_column :relations, :next_action, :datetime
    add_column :relations, :lock_version, :integer
    add_column :relations, :user_id, :integer
    add_column :relations, :type, :string
    add_column :relations, :search_lock, :integer
  end

  def self.down
    remove_column :relations, :search_lock
    remove_column :relations, :type
    remove_column :relations, :user_id
    remove_column :relations, :lock_version
    remove_column :relations, :next_action
    remove_column :relations, :phone
  end
end
