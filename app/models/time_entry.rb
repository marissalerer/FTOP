class TimeEntry < ActiveRecord::Base
  attr_accessible :coop_id, :date_worked, :hours_worked, :description

  belongs_to :member,
             inverse_of: :time_entries

  validates_presence_of :date_worked,
  											:hours_worked
  											
  #validates_presence_of :member, :message => ""
  validates_presence_of :coop_id, :message => "is invalid."
	
	validates_numericality_of :hours_worked, greater_than: 0

  # Callbacks
  after_save :update_member_month_report
  before_destroy :remove_member_month_report_hours
  
  def update_member_month_report
    report = member.member_month_reports.for_date(created_at)
    report.hours_worked += hours_worked - (hours_worked_was || 0)
    report.save!
  end
  
  def remove_member_month_report_hours
    #if a time entry is removed, delete the hours associated with its report
    report = member.member_month_reports.for_date(created_at)
    report.hours_worked -= hours_worked_was
    report.save!
  end

  # Virtual Attributes
  # when time entry form submits coop_id, find a member & set it
  def coop_id=(id)
    self.member = Member.find_by_coop_id(id)
  end
  
  def coop_id
    member.try(:coop_id)
  end
end
