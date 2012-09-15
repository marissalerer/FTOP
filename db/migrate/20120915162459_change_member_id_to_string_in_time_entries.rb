class ChangeMemberIdToStringInTimeEntries < ActiveRecord::Migration
  def change
  	change_column :time_entries, :member_id, :string
  end
end
