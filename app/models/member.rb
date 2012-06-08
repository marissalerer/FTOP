class Member < ActiveRecord::Base
  attr_accessible :coop_id, :first_name, :last_name, :email_address, :supervisor, :current_hours, :carryover_hours
  validates_presence_of :coop_id,
  						:first_name,
  						:last_name,
  						:email_address
  validates_uniqueness_of :email_address, :coop_id
  has_many :time_entries, :foreign_key => :coop_id

  def full_name
  	self.first_name + " " + self.last_name
  end
end
