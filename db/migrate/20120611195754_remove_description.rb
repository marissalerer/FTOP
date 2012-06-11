class RemoveDescription < ActiveRecord::Migration
  def up
  	remove_column :time_entries, :description
  	remove_column :time_entries, :comment
  end

  def down
  end
end
