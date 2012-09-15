class MemberMonthReport < ActiveRecord::Base
  attr_accessible :carryover_hours, :member_id, :month, :shifts_worked, :year
  
  belongs_to :member,
             inverse_of: :member_month_reports
end
