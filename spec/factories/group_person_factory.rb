FactoryBot.define do
  factory :group_person do
    association :group, factory: :group
    association :person, factory: :person
  end
end
