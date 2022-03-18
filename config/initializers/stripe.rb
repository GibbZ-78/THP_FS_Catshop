# Adding public and secret keys to STRIPE configuration
Rails.configuration.stripe = {
  publishable_key: ENV["STRIPE_PUBLISHABLE_KEY"],
  secret_key: ENV["STRIPE_SECRET_KEY"]
}

# Setting up STRIPE "API Key" to the "secret_key" value defined above
# via the environment file (".env") or environment variables (e.g. on Heroku)
Stripe.api_key = Rails.configuration.stripe[:secret_key]