class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :coop_id, :null => false
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :email_address, :null => false
      t.float :carryover_hours, :null => false, :default => 0
      t.float :current_hours, :null => false, :default => 0
      t.timestamps
    end
    add_index :members, :email_address, :unique => true
    add_index :members, :coop_id, :unique => true
  end
end
