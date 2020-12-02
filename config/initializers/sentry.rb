# frozen_string_literal: true

if ENV['SENTRY_DSN']
  Raven.configure do |config|
    config.dsn = ENV['SENTRY_DSN']
    config.current_environment = ENV.fetch('SENTRY_ENV', Rails.env)
    if %w[production staging].include? config.current_environment
      config.release = File.read('VERSION')
    end
  end
end
