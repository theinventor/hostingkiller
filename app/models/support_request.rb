class SupportRequest < ActiveRecord::Base
  validates_presence_of :domain, :customer_email, :name, :phone, :notes
  validates_uniqueness_of :domain, :customer_email
end
