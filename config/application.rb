require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BookFinder
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    #allow access to lib file for API consumption & Book object
    config.eager_load_paths << Rails.root.join('lib')

    #add config for minitest
    config.generators do |g|
      g.test_framework :minitest, spec: true
    end

    #set up to use error pages from rails app
    config.exceptions_app = self.routes

    #Disable unused Rack middleware
    config.eager_load = false
    config.middleware.delete Rack::Sendfile
    config.middleware.delete ActiveSupport::Cache::Strategy::LocalCache::Middleware
    config.middleware.delete Rack::Runtime
    config.middleware.delete Rack::MethodOverride
    config.middleware.delete ActionDispatch::RequestId
    config.middleware.delete Rails::Rack::Logger
    config.middleware.delete ActionDispatch::ShowExceptions
    config.middleware.delete ActionDispatch::DebugExceptions
    config.middleware.delete ActionDispatch::Reloader
    config.middleware.delete ActionDispatch::Callbacks
    config.middleware.delete ActionDispatch::Cookies
    config.middleware.delete ActionDispatch::Session::CookieStore
    config.middleware.delete ActionDispatch::Flash
    config.middleware.delete Rack::Head
    config.middleware.delete Rack::ConditionalGet
    config.middleware.delete Rack::ETag
  end
end
