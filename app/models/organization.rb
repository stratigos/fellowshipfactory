class Organization < ApplicationRecord
  has_many :groups, dependent: :destroy, inverse_of: :organization
end
