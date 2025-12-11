class OrganizationPerson < ApplicationRecord
  belongs_to :organization, inverse_of: :organization_people
  belongs_to :person, inverse_of: :organization_people
end
