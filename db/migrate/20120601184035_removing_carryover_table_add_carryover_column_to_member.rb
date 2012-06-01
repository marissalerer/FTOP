class RemovingCarryoverTableAddCarryoverColumnToMember < ActiveRecord::Migration
  def up
  	drop_table :member_carryover
  	add_column :members, :carryover_hours, :float, :default => 0
  end

  def down
  end
end
