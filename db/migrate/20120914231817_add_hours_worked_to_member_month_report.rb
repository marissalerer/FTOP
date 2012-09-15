class AddHoursWorkedToMemberMonthReport < ActiveRecord::Migration
  def change
    add_column "member_month_reports", :hours_worked, :float, default: 0, null: false
  end
end
