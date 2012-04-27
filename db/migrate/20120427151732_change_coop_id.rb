class ChangeCoopId < ActiveRecord::Migration
  def change
    change_column :members, :coop_id, :integer, :null => true
  end
end
