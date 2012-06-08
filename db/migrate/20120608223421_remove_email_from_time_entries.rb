class RemoveEmailFromTimeEntries < ActiveRecord::Migration
  def up
  	remove_column :time_entries, :email_address
  end

  def down
  end
end
