class RemoveOldFields < ActiveRecord::Migration
  def up
    remove_columns "member_month_reports", :year, :month
    remove_columns "members", :carryover_hours, :current_hours
  end

  def down
    raise "IrreversibleMigration"
  end
end
