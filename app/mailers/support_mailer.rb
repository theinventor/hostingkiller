class SupportMailer < ActionMailer::Base
  default from: "no-reply@reallyclicking.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.support_mailer.comment.subject
  #
  def comment(support_request,body)

    @body = "#{body}\n\n View/Comment on this request online: #{Rails.env.production? ? PAYPAL_NOTIFY_URL : PAYPAL_NOTIFY_URL_SANDBOX}/submissions/#{support_request.token}"

    mail to: [support_request.customer_email], bcc: [CC_EMAIL], subject: "New Message from WebSite Support Portal (id: #{support_request.id})"
  end
end
