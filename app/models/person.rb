class Person < ApplicationRecord
  has_many :group_people, dependent: :destroy, inverse_of: :person
  has_many :groups, through: :group_people
  has_many :organization_people, dependent: :destroy, inverse_of: :person
  has_many :organizations, through: :organization_people

  validates(
    :age,
    presence: true,
    numericality: {greater_than: 12, less_than: 121, only_integer: true}
  )

  validates(
    :email,
    format: {with: URI::MailTo::EMAIL_REGEXP},
    presence: true,
    uniqueness: true
  )

  validates :first_name, length: {minimum: 3, maximum: 16}, presence: true
  validates :last_name, length: {minimum: 3, maximum: 32}, presence: true
end
