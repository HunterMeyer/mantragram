# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Mantragram::Application.initialize!

Mail.defaults do
  delivery_method :smtp,
  {
    :address => 'smtp.zoho.com',
    :port => 465,
    :domain => ENV['MANTRA_ZOHO_URL'],
    :user_name => ENV['MANTRA_ZOHO_UN'],
    :password => ENV['MANTRA_ZOHO_PW'],
    :authentication => 'login',
    :ssl => true,
    :tls => true,
    :enable_starttls_auto => true
  }
end