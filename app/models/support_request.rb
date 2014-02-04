class SupportRequest < ActiveRecord::Base
  validates_presence_of :domain, :customer_email, :name, :phone, :notes
  validates_uniqueness_of :domain, :customer_email
  has_many :comments, dependent: :destroy

  before_create :generate_token

  def generate_token
    self.token = SecureRandom.uuid
  end
end
