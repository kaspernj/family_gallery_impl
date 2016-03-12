source "https://rubygems.org"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "4.2.6"

gem "awesome_translations", github: "kaspernj/awesome_translations", branch: "kj/rubocop_rails_best_practices_scss_lint_coffeelint_haml_lint"
gem "auto_autoloader", github: "kaspernj/auto_autoloader"
gem "string-cases", "0.0.4"

gem "family_gallery", github: "kaspernj/family_gallery"
gem "bootstrap_builders", github: "kaspernj/bootstrap_builders"

# gem "family_gallery", path: "/Users/kaspernj/Dev/Rails/family_gallery"
# gem "bootstrap_builders", path: "/Users/kaspernj/Dev/Ruby/bootstrap_builders"

gem "mysql2", "~> 0.3.19"

group :development do
  # Use Capistrano for deployment
  gem "capistrano", "3.4.0"
  gem "capistrano-rails", "1.1.6"
  gem "capistrano-bundler", "1.1.4"
  gem "capistrano-passenger", "0.2.0"

  gem "spring", "1.6.4"
  gem "spring-commands-rspec", "1.0.4"
  gem "spring-commands-rubocop", "0.1.0"

  gem "colorize", "0.6.0"
  gem "pry"
  gem "best_practice_project", github: "kaspernj/best_practice_project"
  gem "rubocop", "0.38.0"
  gem "rails_best_practices", "1.16.0"
  gem "coffeelint", "1.14.0"
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem "sdoc", require: false
end

group :development, :test do
  gem "rspec-rails", "3.3.1"
end
