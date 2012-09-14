class SetDefaultsForReporting < ActiveRecord::Migration
  def change
  	change_column :member_month_reports, :carryover_hours, :float, :default => 0
  	change_column :member_month_reports, :shifts_worked, :integer, :default => 0
  end
end
