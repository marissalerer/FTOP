class Member < ActiveRecord::Base
  attr_accessible :coop_id, :first_name, :last_name, :email_address

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
  	first_name + " " + last_name
  end
end
