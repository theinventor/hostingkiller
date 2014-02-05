class SupportRequest < ActiveRecord::Base

  validates_presence_of :domain, :customer_email, :name, :phone, :notes
  validates_uniqueness_of :domain, :customer_email
  has_many :comments, dependent: :destroy
  serialize :paypal_params

  before_create :generate_token
  after_create :email_the_staff

  def email_the_staff
    SupportMailer.comment(sr,"Thanks for submitting a request! Someone will get back to you ASAP.\n\n Domain: #{domain}\nName: #{name}\nPhone: #{phone}").deliver
  rescue => ex
  end

  def generate_token
    self.token = SecureRandom.uuid
  end

  def recheck
    begin
      s = Socket.getaddrinfo(domain,nil)
      result = s[0][3]
    rescue => ex
    end
    if result and result != ip_address
      update_column :ip_address, result
    end

    begin
      client = RoboWhois.new(:api_key => ROBOWHOIS_KEY)
      response = client.whois(domain)
    rescue
    end

    if response
      update_column :whois, response.to_s
    end


  end
end
