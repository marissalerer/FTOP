class ChangeCarryOverToFloat < ActiveRecord::Migration
  def change
  	change_column :member_month_reports, :carryover_hours, :float

  end

end
