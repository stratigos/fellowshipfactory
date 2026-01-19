source "https://rubygems.org"

gem "rails", "~> 8.1.1"

gem "bootsnap", "~> 1.20.1", require: false # Reduces boot times through caching; required in config/boot.rb
# gem "bcrypt", "~> 3.1.7" # Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem "image_processing", "~> 1.2" # Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "importmap-rails", "~> 2.2" # Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "jbuilder", "~> 2.14.1"
gem "kamal", "~> 2.10.1", require: false # Deploy this application anywhere as a Docker container [https://kamal-deploy.org]
gem "propshaft", "~> 1.3.1" # The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem "puma", ">= 5.0"
gem "stimulus-rails", "~> 1.3.4"
gem "turbo-rails", "~> 2.0.20"
gem "pg", "~> 1.6.2"
gem "solid_cable", "~> 3.0.12" # Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "solid_cache", "~> 1.0.10" # Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "solid_queue", "~> 1.2.4" # Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "standard", "~> 1.53.0"
gem "thruster", "~> 0.1.17", require: false # Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]

group :development do
  gem "web-console" # Use console on exceptions pages [https://github.com/rails/web-console]
end

group :development, :test do
  gem "brakeman", require: false # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "bundler-audit", require: false # Audits gems for known security defects (use config/bundler-audit.yml to ignore issues)
  gem "capybara", "~> 3.40"
  gem "debug", platforms: %i[mri windows], require: "debug/prelude" # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "factory_bot_rails", "~> 6.5"
end

group :test do
  gem "rspec-rails", "~> 8.0"
  gem "selenium-webdriver"
  gem "shoulda-matchers", "~> 7.0"
end
