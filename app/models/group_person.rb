class GroupPerson < ApplicationRecord
  belongs_to :group, inverse_of: :group_people
  belongs_to :person, inverse_of: :group_people
end
