class Supervisor < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email_address
  validates_presence_of :first_name, :last_name, :email_address
  validates_uniqueness_of :email_address
end