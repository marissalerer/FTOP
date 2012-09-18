class FixReportsToUseTimeEntryCreatedAt < ActiveRecord::Migration
  class MemberMonthReport < ActiveRecord::Base; end
  class TimeEntry < ActiveRecord::Base; end

  def up
    MemberMonthReport.delete_all
    
    member_carryover = {}
    
    TimeEntry.order(:member_id, :created_at).each do |e|
      range = range_around(e.created_at)
      r = MemberMonthReport.where(member_id: e.member_id, start_date: range.begin, end_date: range.end).first_or_create!

      r.hours_worked += e.hours_worked

      last_carry_over = member_carryover[e.member_id] || 0
      total_hours = last_carry_over + r.hours_worked


      r.shifts_worked = (total_hours / 2.75).floor
      member_carryover[e.member_id] = r.carryover_hours = total_hours - r.shifts_worked * 2.75

      r.save!
    end
  end

  def down
    raise "IrreversibleMigration"
  end



  def range_around(date)
    #given a date, returns a range starting on the previous 15th of the month and ending on the following
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
