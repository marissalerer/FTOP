class ChangeShiftsWorkedToFloat < ActiveRecord::Migration
  def change
  	change_column :member_month_reports, :shifts_worked, :float
  end
end
