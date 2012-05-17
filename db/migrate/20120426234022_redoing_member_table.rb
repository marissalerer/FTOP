class RedoingMemberTable < ActiveRecord::Migration
  def up
  end

  def down
  	drop_table :supervisors
  end
end
