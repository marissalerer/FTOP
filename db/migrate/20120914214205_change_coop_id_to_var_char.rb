class ChangeCoopIdToVarChar < ActiveRecord::Migration
  def change
  	change_column :member_month_reports, :member_id, :string
  end
end
