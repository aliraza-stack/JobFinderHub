require_relative "boot"

require "rails/all"
# require 'dotenv/load'
Bundler.require(*Rails.groups)

module JobFinderHub
  class Application < Rails::Application
    config.load_defaults 7.0
    Bundler.require(*Rails.groups)
    config.sass.inline_source_maps = true
    config.sass.cache = false
    config.sass.preferred_syntax = :scss
    config.sass.line_comments = false
    config.assets.enabled = false
    config.public_file_server.enabled = true

    # Load dotenv only in development or test environment
    if ['development', 'test'].include? ENV['RAILS_ENV']
      Dotenv::Railtie.load
    end

  end
end
