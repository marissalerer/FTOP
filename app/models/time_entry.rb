class TimeEntry < ActiveRecord::Base
  attr_accessible :coop_id, :date_worked, :hours_worked, :description

  belongs_to :member,
             inverse_of: :time_entries

  validates_presence_of :member,
  											:date_worked,
  											:hours_worked,
  											:coop_id
	
	validates_numericality_of :hours_worked, greater_than: 0

  # Callbacks
  after_save :update_member_month_report
  before_destroy :remove_member_month_report_hours
  
  def update_member_month_report
    old_report = member.member_month_reports.for_date(date_worked_was) if date_worked_was
    new_report = member.member_month_reports.for_date(date_worked)
    
    if old_report && old_report != new_report
      # if the reports changed
      old_report.hours_worked -= hours_worked_was
      new_report.hours_worked += hours_worked
      
      [old_report, new_report].each(&:save!)

    else
      # update the hours
      new_report.hours_worked += hours_worked - (hours_worked_was || 0)
      new_report.save!
    end    
  end
  
  def remove_member_month_report_hours
    report = member.month_reports.for_date(date_worked_was)
    report -= hours_worked_was
    report.save!
  end

  # Virtual Attribute
  def coop_id=(id)
    self.member = Member.find_by_coop_id(id)
  end
  
  def coop_id
    member.try(:coop_id)
  end
end
