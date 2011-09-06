class AddFieldsToHour < ActiveRecord::Migration
  def self.up
    add_column :hours, :user_id, :integer
    add_column :hours, :relation_id, :integer
  end

  def self.down
    remove_column :hours, :relation_id
    remove_column :hours, :user_id
  end
end
