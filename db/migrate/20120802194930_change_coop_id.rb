class ChangeCoopId < ActiveRecord::Migration
   def change
    change_column :members, :coop_id, :string
    change_column :time_entries, :coop_id, :string
   end
end