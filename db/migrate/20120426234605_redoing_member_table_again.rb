class RedoingMemberTableAgain < ActiveRecord::Migration
  def up
  	drop_table :supervisors
  end

  def down
  end
end
