# Load the Rails application.
require_relative 'application'

# Configure send email
Rails.application.configure do
  config.action_mailer.perform_deliveries = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 587,
    domain:               'asiantech.vn',
    user_name:            ENV['GMAIL_USERNAME'],
    password:             ENV['GMAIL_PASSWORD'],
    authentication:       'plain',
    enable_starttls_auto: true,
    openssl_verify_mode:  'none'
  }
end

# Initialize the Rails application.
Rails.application.initialize!
