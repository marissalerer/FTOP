class Member < ActiveRecord::Base
  attr_accessible :coop_id, :first_name, :last_name, :email_address
  validates_presence_of :coop_id,
  						:first_name,
  						:last_name,
  						:email_address
  validates_uniqueness_of :email_address, :coop_id
  has_many :time_entries, :foreign_key => :coop_id
end
