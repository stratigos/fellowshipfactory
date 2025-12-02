RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.order = :random

  config.example_status_persistence_file_path = "spec/examples.txt"
  # config.profile_examples = 10 # slow specs
  config.shared_context_metadata_behavior = :apply_to_host_groups

  if config.files_to_run.one?
    config.default_formatter = "doc"
  end

  config.disable_monkey_patching!
  Kernel.srand config.seed # for --seed, given :random order
end
