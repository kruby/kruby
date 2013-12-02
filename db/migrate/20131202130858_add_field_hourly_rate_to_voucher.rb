class AddFieldHourlyRateToVoucher < ActiveRecord::Migration
  def change
    add_column :vouchers, :hourly_rate, :integer
  end
end
