class TimeEntry < ActiveRecord::Base
  attr_accessible :coop_id, :date_worked, :hours_worked, :supervisor_id, :description, :comment, :email_address
  validates_presence_of :coop_id, 
  											:date_worked,
  											:hours_worked,
  											:supervisor_id				
  validates_length_of :description,
  										:comment,
  									 	:in => 0..255
  belongs_to :member, :foreign_key => :coop_id
  belongs_to :member, :foreign_key => :supervisor_id
  validates_inclusion_of :coop_id, :in => Proc.new { Member.all.collect(&:coop_id) }
  validates_inclusion_of :supervisor_id, :in => Proc.new { Member.all.collect(&:id) }
end
