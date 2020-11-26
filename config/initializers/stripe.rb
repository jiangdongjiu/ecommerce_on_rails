# config stripe gem with the keys(publishable key and secret key)
Rails.configuration.stripe = {
  publishable_key: ENV["PUBLISHABLE_KEY"],
  secret_key:      ENV["SECRET_KEY"]
}
# ENV access the operating system environment variables
# Reason for using ENV is that we dont want to have the keys inside our source code
# For linus os, easiest way is to put the environment variable before the rails s, allow the rails server to access env variables.
# other way is to use a .env(gem) to configure it, and make sure put .env in gitignore. You need the .env when deployment
# For cloud server to config the environment variables. check the docker video.

# PUBLISHABLE_KEY=pk_..... SECRET_KEY=sk_... rails s

Stripe.api_key = Rails.configuration.stripe[:secret_key]
