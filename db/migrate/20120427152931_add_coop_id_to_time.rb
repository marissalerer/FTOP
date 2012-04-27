class AddCoopIdToTime < ActiveRecord::Migration
  def change
    add_column :time_entries, :coop_id, :integer, :default => 0, :null => false
  end
end