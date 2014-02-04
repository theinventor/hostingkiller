require 'test_helper'

class SupportMailerTest < ActionMailer::TestCase
  test "comment" do
    mail = SupportMailer.comment
    assert_equal "Comment", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
