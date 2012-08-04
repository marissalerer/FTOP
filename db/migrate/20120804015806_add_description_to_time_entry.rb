class AddDescriptionToTimeEntry < ActiveRecord::Migration
  def change
  	add_column :time_entries, :description, :string
  end
end
