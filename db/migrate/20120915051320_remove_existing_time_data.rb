class RemoveExistingTimeData < ActiveRecord::Migration
  class MemberMonthReport < ActiveRecord::Base; end
  class TimeEntry < ActiveRecord::Base; end
  
  def up
    MemberMonthReport.delete_all
    TimeEntry.delete_all
  end

  def down
    raise "IrreversibleMigration"
  end
end
