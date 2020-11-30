# frozen_string_literal: true

if ENV['SENTRY_DSN']
  Raven.configure do |config|
    config.dsn = ENV['SENTRY_DSN']
    config.current_environment = ENV.fetch('SENTRY_ENV', Rails.env)
    config.release = File.read('VERSION') if config.current_environment == 'production'
  end
end
