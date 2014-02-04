class SupportMailer < ActionMailer::Base
  default from: "no-reply@reallyclicking.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.support_mailer.comment.subject
  #
  def comment(support_request,body)

    @body = body

    mail to: [support_request.customer_email], bcc: [ENV["CC_EMAIL"]], subject: "New Comment from WebSite Support Portal (id: #{support_request.id})"
  end
end
