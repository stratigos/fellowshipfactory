class Admin < ApplicationRecord
  validates(
    :email,
    format: {with: URI::MailTo::EMAIL_REGEXP},
    presence: true,
    uniqueness: true
  )

  validates :first_name, length: {minimum: 3, maximum: 16}, presence: true
  validates :last_name, length: {minimum: 3, maximum: 32}, presence: true
end
