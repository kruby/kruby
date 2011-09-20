class ChangeFieldInHour < ActiveRecord::Migration
  def self.up
    change_column :hours, :number, :decimal, :precision => 10, :scale => 2
  end

  def self.down
    change_column :hours, :number, :integer
  end
end
