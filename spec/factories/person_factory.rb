FactoryBot.define do
  factory :person do
    sequence(:age) { rand(18...85) }
    sequence(:email) { "personguy-#{it}@example.com" }
    sequence(:first_name) { "Personguy" }
    sequence(:last_name) { "Lastname" }
  end
end
