FamilyGalleryImpl::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_deliveries = true

  smtp_config = YAML.load(File.read(Rails.root.join('config', 'smtp.yml'))).symbolize_keys!

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = smtp_config
  config.action_mailer.default_options = {
    from: smtp_config[:default_from]
  }

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true
  config.assets.precompile += ['light_mobile/basic_layout.js', 'light_mobile/basic_layout.css', 'family_gallery/application_mobile.js', 'family_gallery/application_mobile.css']

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
end
