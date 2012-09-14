class CreateMemberMonthReports < ActiveRecord::Migration
  def change
    create_table :member_month_reports do |t|
      t.integer :member_id
      t.integer :year
      t.integer :month
      t.integer :shifts_worked
      t.integer :carryover_hours
      t.timestamps
    end
  end
end
