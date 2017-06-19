if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
  	publishable_key: 'pk_test_T0Tq7n4sTnt61TvFuYrlI7LA',
  	secret_key: 'sk_test_opCqXnaWyMU1oYS8D6aqYzYq'

   
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]

