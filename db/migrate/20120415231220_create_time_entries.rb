class CreateTimeEntries < ActiveRecord::Migration
  def change
    create_table :time_entries do |t|
    	t.string :email_address, :null => false
    	t.datetime :date_worked, :null => false
    	t.float :hours_worked, :null => false
    	t.integer :supervisor_id, :null => false
    	t.string :description
    	t.string :comment
      t.timestamps
    end
  end
end
