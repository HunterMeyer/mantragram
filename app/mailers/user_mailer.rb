require 'mail'
require 'erb'
class UserMailer < ActionMailer::Base
  include Devise::Mailers::Helpers
  add_template_helper(ApplicationHelper)

  def mantra_message(mantra)
    image = open(mantra.image.url).read if mantra.image.present?
    mail = Mail.new do
      from     'mantras@mantragram.herokuapp.com'
      to       mantra.user.smtp_address
      subject  mantra.title
      body     '/Mantragram'
    end
    mail.attachments[mantra.image_file_name] = image if mantra.image.present?
    mail.deliver!
  end

  def confirmation_instructions(recipient, token, opts={})
    # @token = token
    # devise_mail(record, :confirmation_instructions, opts)
    mail = Mail.new do
      from    'mantras@mantragram.herokuapp.com'
      to      recipient.smtp_address
      subject 'Welcome to Mantragram'
      body    'Reply 12345 to confirm account. This doesnt work yet.'
    end

    mail.deliver!
  end

  def reset_password_instructions(record, token, opts={})
    recipient = record
    reset_password_url = "#{Rails.root}/users/password/edit?reset_password_token=#{token}"

    mail = Mail.new do
      from    'mantras@mantragram.herokuapp.com'
      to      recipient.smtp_address
      subject 'Reset Password'
      body    reset_password_url
    end
    mail.deliver!
  end

  def unlock_instructions(record, token, opts={})
    @token = token
    devise_mail(record, :unlock_instructions, opts)
  end

end
