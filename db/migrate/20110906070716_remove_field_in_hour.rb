class RemoveFieldInHour < ActiveRecord::Migration
  def self.up
    remove_column :hours, :user
  end

  def self.down
    add_column :hours, :user_name, :string
  end
end
