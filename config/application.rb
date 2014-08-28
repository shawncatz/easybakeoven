require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
# require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Easybakeoven
  class Application < Rails::Application
        # config.cache_store = :null_store
    config.cache_store = :redis_store, 'redis://localhost:6379/10/cache', { expires_in: 1.hour }

        # haml assets in production
    # http://stackoverflow.com/a/18836385
    require 'haml'

    config.assets.paths << Rails.root.join("app", "assets", "templates")

    class HamlTemplate < Tilt::HamlTemplate
      def prepare
        @options = @options.merge :format => :html5
        super
      end
    end

    config.before_initialize do |app|
      require 'sprockets'
      Sprockets::Engines #force autoloading
      Sprockets.register_engine '.haml', HamlTemplate
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end
end