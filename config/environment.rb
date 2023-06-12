# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!




ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey',
  :password => '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',
  :domain => 'https://job-finder-hub.herokuapp.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  from: 'associate-portfolio@aliraza.live',
  :authentication => :plain,
  :enable_starttls_auto => true
}