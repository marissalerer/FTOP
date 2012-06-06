class RemoveEmailAddressFromTimeEntries < ActiveRecord::Migration
  def change
		change_column :time_entries, :email_address, :string, null: true
  end
end


