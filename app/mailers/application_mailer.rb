class ApplicationMailer < ActionMailer::Base
  default from: ENV['OWNER_MAIL_ADDRESS']
  layout 'mailer'
end
