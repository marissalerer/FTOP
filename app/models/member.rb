class Member < ActiveRecord::Base
  attr_accessible :coop_id, :first_name, :last_name, :email_address, :current_hours, :carryover_hours


  has_many :time_entries,
           inverse_of: :member,
           dependent: :destroy

  has_many :member_month_reports,
           inverse_of: :member,
           dependent: :destroy
           


  validates_presence_of :coop_id,
  						:first_name,
  						:last_name,
  						:email_address

  validates_uniqueness_of :email_address, :coop_id

  def full_name
  	self.first_name + " " + self.last_name
  end
end
