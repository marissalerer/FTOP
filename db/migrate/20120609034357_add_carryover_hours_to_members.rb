class AddCarryoverHoursToMembers < ActiveRecord::Migration
  def change
  	add_column :members, :carryover_hours, :float, :default => 0
  end
end
