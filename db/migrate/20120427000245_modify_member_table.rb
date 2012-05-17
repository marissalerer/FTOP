class ModifyMemberTable < ActiveRecord::Migration
  def change
  	change_column :members, :coop_id, :integer, null: true
  	add_column :members, :supervisor, :boolean, null: false, default: false
  end

end
