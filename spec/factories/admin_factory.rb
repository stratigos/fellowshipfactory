FactoryBot.define do
  factory :admin do
    sequence(:email) { "adminperson-#{it}@example.com" }
    sequence(:first_name) { "Adminperson" }
    sequence(:last_name) { "Employeeperson" }
  end
end
