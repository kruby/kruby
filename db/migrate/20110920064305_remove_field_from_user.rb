# -*- encoding : utf-8 -*-
class RemoveFieldFromUser < ActiveRecord::Migration
  def self.up
    remove_column :users, :relation_id
  end

  def self.down
    add_column :users, :relation_id, :integer
  end
end
