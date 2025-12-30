require "rails_helper"

RSpec.describe(Admin, type: :model) do
  subject { build(:admin) }

  it do
    is_expected.to(
      allow_values("admin@example.com", "test.name@sub.domain.example.org")
        .for(:email)
    )

    is_expected.not_to(
      allow_values("admin", "@example.com", "example.net", "test@example.")
        .for(:email)
    )
  end

  it { is_expected.to(validate_presence_of(:email)) }
  it { is_expected.to(validate_uniqueness_of(:email)) }

  it do
    is_expected.to(
      validate_length_of(:first_name).is_at_least(3).is_at_most(16)
    )
  end

  it { is_expected.to(validate_presence_of(:first_name)) }

  it do
    is_expected.to(validate_length_of(:last_name).is_at_least(3).is_at_most(32))
  end

  it { is_expected.to(validate_presence_of(:last_name)) }

  it "has a valid factory" do
    expect(build(:admin)).to(be_valid)
  end
end
