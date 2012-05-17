class ModifyTimeEntries < ActiveRecord::Migration
  def change
  	change_column :time_entries, :date_worked, :date
  end
end
