FactoryBot.define do
  factory :group do
    association :organization, factory: :organization
    sequence(:name) { "Laborers of Love ##{it}" }
  end
end
