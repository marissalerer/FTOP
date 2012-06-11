class TimeEntry < ActiveRecord::Base
  attr_accessible :coop_id, :date_worked, :hours_worked
  validates_presence_of :coop_id, 
  											:date_worked,
  											:hours_worked
  validates_length_of :description,
  										:comment,
  									 	:in => 0..255
  belongs_to :member, :foreign_key => :coop_id
  validates_inclusion_of :coop_id, :in => Proc.new { Member.all.collect(&:coop_id) }
end
