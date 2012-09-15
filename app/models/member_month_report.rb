class MemberMonthReport < ActiveRecord::Base
  belongs_to :member,
             inverse_of: :member_month_reports
  
  before_save :update_hours, if: :hours_worked_changed?
  after_save :update_next_report, if: :carryover_hours_changed?
  
  def update_hours
    last_carryover_hours = previous_report.try(:carryover_hours) || 0
    total_hours = hours_worked + last_carryover_hours
    self.shifts_worked = (total_hours / 2.75).floor
    self.carryover_hours = total_hours - shifts_worked * 2.75
  end
  
  def update_next_report
    r = next_report
    return unless r
    
    r.update_hours
    r.save!
  end
  
  def previous_report
    MemberMonthReport.where('end_date <= ?', start_date).reorder(:start_date).last
  end
  def next_report
    MemberMonthReport.where('start_date >= ?', end_date).reorder(:start_date).first
  end
  
  
  def self.for_date(date)
    where("start_date <= ? AND ? < end_date", date, date).first_or_create! do |r|
      range = range_around(date)
      r.start_date = range.begin
      r.end_date = range.end
    end
  end
  
  def self.range_around(date)
    if date.day >= 15
      start_date = date - (date.day - 15).days

      end_date = date.next_month
      end_date -= (end_date.day - 15).days
    
    else
      start_date = date.prev_month
      start_date += (15 - start_date.day).days
  
      end_date = date + (15 - date.day).days
    end
    
    start_date...end_date
  end
end
