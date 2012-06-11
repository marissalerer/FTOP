class RemoveSupervisors < ActiveRecord::Migration
  def up
  	remove_column :members, :supervisor
  	remove_column :time_entries, :supervisor_id
  end

  def down
  end
end
