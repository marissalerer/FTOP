class AddDateRangeToMemberMonthReport < ActiveRecord::Migration
  def change
    change_table :member_month_reports do |t|
      t.date :start_date
      t.date :end_date
    end
  end
end
