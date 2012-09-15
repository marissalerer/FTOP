class FixTimeEntryMemberRelationship < ActiveRecord::Migration
  class Member < ActiveRecord::Base; end
  class TimeEntry < ActiveRecord::Base; end

  def up
    add_column "time_entries", :member_id, :integer
    
    TimeEntry.find_each do |entry|
      entry.member_id = Member.find_by_coop_id(entry.coop_id).id
      entry.save!
    end
    
    change_column_null "time_entries", :member_id, false
    remove_column "time_entries", :coop_id
    
    add_index "time_entries", :member_id
  end
  
  def down
    raise "IrreversibleMigration"
  end
end
