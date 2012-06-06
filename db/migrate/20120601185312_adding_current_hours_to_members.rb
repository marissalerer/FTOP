class AddingCurrentHoursToMembers < ActiveRecord::Migration
  def up
  	add_column :members, :current_hours, :float, :default => 0
  end

  def down
  end
end
