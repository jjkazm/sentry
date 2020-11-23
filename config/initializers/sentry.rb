# frozen_string_literal: true

if ENV['SENTRY_DSN']
  Raven.configure do |config|
    config.dsn = ENV['SENTRY_DSN']
    config.current_environment = ENV.fetch('SENTRY_ENV', Rails.env)
    case config.current_environment
    when 'production'
      config.release = File.open('VERSION').read
    when 'staging'
      ## The below line will be raplaced once
      ## the integration Github-Sentry is done by Infra team
      ## https://hopiin.slack.com/archives/C014G9GLS21/p1605878977262400
      config.release = ENV['HEROKU_SLUG_COMMIT']
    end
  end
end
