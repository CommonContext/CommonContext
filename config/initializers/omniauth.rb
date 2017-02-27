Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, ENV['LINKEDIN_CLIENT_ID'], ENV['LINKEDIN_SECRET_KEY'], :scope => 'r_basicprofile r_emailaddress'
end