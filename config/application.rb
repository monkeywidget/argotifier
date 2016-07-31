require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
#   Bundler.require(*Rails.groups(:assets => %w(development test)))


module Argotifier
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # e.g. DB name "documents" vs "document"
    # changed in rails 3.1.? and broke everything!  (2014-02)
    #config.active_record.pluralize_table_names = true

    # Configure the default encoding used in templates for Ruby 1.9.
    #config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    #config.filter_parameters += [:password]

    # Enable the asset pipeline
    #config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    #config.assets.version = '1.0'
  end
end
