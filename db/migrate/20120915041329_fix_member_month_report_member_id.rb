class FixMemberMonthReportMemberId < ActiveRecord::Migration
  class Member < ActiveRecord::Base; end
  class MemberMonthReport < ActiveRecord::Base; end

  def up
    MemberMonthReport.find_each do |r|
      r.member_id = Member.find_by_coop_id(r.member_id)
      r.save!
    end
    change_column_null "member_month_reports", :member_id, false
    
    add_index "member_month_reports", :member_id
  end

  def down
    raise "IrreversibleMigration"
  end
end
