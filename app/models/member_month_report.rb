class MemberMonthReport < ActiveRecord::Base
  attr_accessible :carryover_hours, :member_id, :month, :shifts_worked, :year
end
