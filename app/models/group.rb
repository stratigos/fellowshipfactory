class Group < ApplicationRecord
  belongs_to :organization, inverse_of: :groups
  has_many :group_people, dependent: :destroy, inverse_of: :group
  has_many :people, through: :group_people
end
