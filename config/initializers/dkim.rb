# Configure dkim globally (see above)
Dkim::domain      = 'mantragram.herokuapp.com'
Dkim::selector    = 'zoho'
Dkim::private_key = open('private.pem').read

# This will sign all ActionMailer deliveries
ActionMailer::Base.register_interceptor(Dkim::Interceptor)
