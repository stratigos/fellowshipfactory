FactoryBot.define do
  factory :organization do
    sequence(:name, 10) {
      "Cool Church of Christ #{it}"
    }
  end

  trait :with_group do
    association :groups, factory: :group
  end
end
