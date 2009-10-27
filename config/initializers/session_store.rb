# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_basic_session',
  :secret      => '8729e3df7b614c6e2eeea864d311a2311847eaef22202d148569bb4f491dd0fe9bf92791421a2c31f15cc0201774906ef38b5e2cd97059340af19b9347ae97f3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
