# Replace API_KEY and API_SECRET with the values you got from Twitter
require 'dotenv/load'
Dotenv.load
Rails.application.config.middleware.use OmniAuth::Builder do
    provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  end