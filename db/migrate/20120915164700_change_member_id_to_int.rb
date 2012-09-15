class ChangeMemberIdToInt < ActiveRecord::Migration
  def change
  	change_column :time_entries, :member_id, :integer
  	change_column :member_month_reports, :member_id, :integer
  end
end
