require "rails_helper"

RSpec.describe(Person, type: :model) do
  subject { build(:person) }

  it do
    is_expected.to(
      have_many(:group_people)
      .dependent(:destroy)
      .inverse_of(:person)
    )
  end

  it { is_expected.to(have_many(:groups).through(:group_people)) }

  it do
    is_expected.to(
      have_many(:organization_people)
      .dependent(:destroy)
      .inverse_of(:person)
    )
  end

  it do
    is_expected.to(have_many(:organizations).through(:organization_people))
  end

  it do
    is_expected.to(
      validate_numericality_of(:age)
        .only_integer
        .is_greater_than(12)
        .is_less_than(121)
    )
  end

  it { is_expected.to(validate_presence_of(:age)) }

  it do
    is_expected.to(
      allow_values("person@example.com", "test.name@sub.domain.example.org")
        .for(:email)
    )

    is_expected.not_to(
      allow_values("person", "@example.com", "example.net", "test@example.")
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
    expect(build(:person)).to(be_valid)
  end
end
