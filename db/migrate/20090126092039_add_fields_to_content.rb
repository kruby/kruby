# -*- encoding : utf-8 -*-
class AddFieldsToContent < ActiveRecord::Migration
  def self.up
    add_column :contents, :controller_redirect, :string
    add_column :contents, :action_redirect, :string
    add_column :contents, :redirect, :boolean
  end

  def self.down
    remove_column :contents, :redirect
    remove_column :contents, :action_redirect
    remove_column :contents, :controller_redirect
  end
end
