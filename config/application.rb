require_relative 'boot'

require 'rails/all'

# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Lebinomeagile
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework :test_unit, fixture: false
    end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.time_zone = 'Europe/Paris'
    # config.active_record.default_timezone = :local

    # Quand tu gères la timezone de ton user -> local
    # Quand tu veux pas gérer les timezones mais que c’est international -> utc
    # Quand tu veux pas gérer les timezones mais que c’est prévu pour un lieu précis -> “Europe/Paris”

  end
end
