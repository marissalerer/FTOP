class CreateTimeEntries < ActiveRecord::Migration
  def change
    create_table :time_entries do |t|
      t.string :email_address, :null => false
      t.date :date_worked, :null => false
      t.float :hours_worked, :null => false
      t.integer :coop_id, :null => false
      t.timestamps
    end
  end
end
