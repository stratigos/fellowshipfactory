class Group < ApplicationRecord
  belongs_to :organization, inverse_of: :groups
end
