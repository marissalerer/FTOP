class AddingMissingTables < ActiveRecord::Migration
  def change
    drop_table :supervisors
  end
end
