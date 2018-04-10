require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OrderFoodyRails
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'application.yml')
      environment = File.exists?(env_file) && YAML.load(File.open(env_file))
      if environment
        environment.each { |key, value| ENV[key.to_s] = value }
      end
    end

    config.autoload_paths << Rails.root.join("app", "services")
    config.autoload_paths << Rails.root.join("app", "operations")
    config.autoload_paths << Rails.root.join("app", "errors")

    config.api_only = true
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**','*.{rb,yml}').to_s]
    config.i18n.default_locale = :en
    config.i18n.fallbacks = true

    Rails.application.config.active_record.belongs_to_required_by_default = false
  end
end
