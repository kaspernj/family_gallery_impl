require File.expand_path("../boot", __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FamilyGalleryImpl; end

class FamilyGalleryImpl::Application < Rails::Application
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
  family_gallery_config = Psych.load_file(Rails.root.join("config", "family_gallery.yml"))
  if family_gallery_config["timezone"].present?
    config.time_zone = family_gallery_config.fetch("timezone")
  end

  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**", "*.yml").to_s]
  config.i18n.load_path += Dir[FamilyGallery::Engine.root.join("config", "locales", "**", "*.yml").to_s]
  config.i18n.default_locale = :da
  config.i18n.available_locales = [:da, :de, :en]
end
