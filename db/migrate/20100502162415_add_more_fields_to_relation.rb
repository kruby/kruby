# -*- encoding : utf-8 -*-
class AddMoreFieldsToRelation < ActiveRecord::Migration
  def self.up
    add_column :relations, :homepage, :string
    add_column :relations, :email, :string
  end

  def self.down
    remove_column :relations, :email
    remove_column :relations, :homepage
  end
end
