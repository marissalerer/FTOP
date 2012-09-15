class ChangeMemberIdToInt < ActiveRecord::Migration
  class TimeEntry < ActiveRecord::Base; end
  class MemberMonthReport < ActiveRecord::Base; end

  def change
    # remove indexes, which for some reason are missing on heroku, hence the rescue
  	remove_index(:time_entries, :member_id) rescue nil
  	remove_index(:member_month_reports, :member_id) rescue nil
  	
  	rename_column :time_entries, :member_id, :member_id_str
  	rename_column :member_month_reports, :member_id, :member_id_str
  	
  	add_column :time_entries, :member_id, :integer
  	add_column :member_month_reports, :member_id, :integer
  	
  	TimeEntry.find_each do |e|
  	  e.member_id = e.member_id_str.to_i
  	  e.save!
  	end
  	
  	MemberMonthReport.find_each do |r|
  	  r.member_id = r.member_id_str.to_i
  	  e.save!
  	end
  	
  	change_column_null :time_entries, :member_id, false
  	change_column_null :member_month_reports, :member_id, false
  	
  	add_index :time_entries, :member_id
  	add_index :member_month_reports, :member_id
  	
  	remove_column :time_entries, :member_id_str
  	remove_column :member_month_reports, :member_id_str
  end
end
