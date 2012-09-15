class TimeEntry < ActiveRecord::Base
  attr_accessible :coop_id, :date_worked, :hours_worked, :description

  belongs_to :member,
             inverse_of: :time_entries

  validates_presence_of :member,
  											:date_worked,
  											:hours_worked,
  											:coop_id
	
  def coop_id=(id)
    self.member = Member.find_by_coop_id(id)
  end
  
  def coop_id
    member.try(:coop_id)
  end
end
