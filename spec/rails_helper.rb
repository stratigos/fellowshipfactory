require "spec_helper"

ENV["RAILS_ENV"] ||= "test"

require_relative "../config/environment"

if Rails.env.production?
  abort("🚫 The Rails environment is running in PRODUCTION mode!")
end

require "rspec/rails"

Rails.root.glob("spec/support/**/*.rb").sort_by(&:to_s).each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  # config.filter_gems_from_backtrace("any-gem-name")
  config.filter_rails_from_backtrace!
  # config.infer_spec_type_from_file_location! # https://rspec.info/features/8-0/rspec-rails
end
