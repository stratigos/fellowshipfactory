class Organization < ApplicationRecord
  has_many :groups, dependent: :destroy, inverse_of: :organization
  has_many :organization_people, dependent: :destroy, inverse_of: :organization
  has_many :people, through: :organization_people
end
