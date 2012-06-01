class AddingCarryoverTable < ActiveRecord::Migration
  def change
    create_table :member_carryover do |t|
			t.integer :coop_id, :null => false
    	t.string :month_year, :null => false
    	t.float :carryover_hours, :null => false
      t.timestamps
    end
  end
end