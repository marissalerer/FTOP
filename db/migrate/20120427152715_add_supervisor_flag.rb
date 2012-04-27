class AddSupervisorFlag < ActiveRecord::Migration
  def change
    add_column :members, :supervisor, :boolean, :default => false
  end
end
