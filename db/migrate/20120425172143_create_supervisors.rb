class CreateSupervisors < ActiveRecord::Migration
  def change
    create_table :supervisors do |t|
      t.string :first_name, :null => false
    	t.string :last_name, :null => false
    	t.string :email_address, :null => false
	    t.timestamps
    end
    add_index :supervisors, :email_address, :unique => true

  end
end
