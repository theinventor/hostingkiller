class Comment < ActiveRecord::Base
  belongs_to :support_request, touch: true

  validates_presence_of :body,:from,:support_request_id

  after_commit :send_email, on: :create

  def send_email
    SupportMailer.comment(support_request,body).deliver
  rescue => ex
    puts "MAIL ERROR: #{ex}, and #{ex.backtrace[0..250]}"
  end
end
