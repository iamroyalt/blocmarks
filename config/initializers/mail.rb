
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address:           'smtp.mailgun.org',
  port:              587,
  authentication:    :plain,
  user_name:         ENV['MAILGUN_SMTP_LOGIN'],
  password:          ENV['MAILGUN_SMTP_PASSWORD'],
  domain:            'app8f8267c3fa6f4c45a3d7be88fdc64a87.mailgun.org',
  #domain:            'shielded-fortress-28843.herokuapp.com',
  enable_starttls_auto: true,
  content_type:      'text/html'
}

# Makes debugging *way* easier.
ActionMailer::Base.raise_delivery_errors = true

class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.to =  'tracyroyal@mac.com'
    message.cc = nil
    message.bcc = nil
  end
end

# Locally, outgoing mail will be 'intercepted' by the
# above DevelopmentMailInterceptor before going out
if Rails.env.development?
  ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)
end
