require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RecruterApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.generators do |g|
      g.factory_bot false

      g.test_frameworks :rspec,
                      fixtures: true,
                      view_spec: false,
                      helper_specs: false,
                      routing_specs: false,
                      request_specs: false,
                      controller_spec: true
      g.factory_bot dir: 'custom/dir/for/factories'
      g.fixtures_replacement :factory_bot, dir: 'custom/dir/for/factories'
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
