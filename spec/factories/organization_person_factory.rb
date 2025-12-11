FactoryBot.define do
  factory :organization_person do
    association :organization, factory: :organization
    association :person, factory: :person
  end
end
