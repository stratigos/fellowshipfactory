require "rails_helper"

RSpec.describe(Organization, type: :model) do
  it do
    is_expected.to(
      have_many(:groups)
      .dependent(:destroy)
      .inverse_of(:organization)
    )
  end

  it do
    is_expected.to(
      have_many(:organization_people)
      .dependent(:destroy)
      .inverse_of(:organization)
    )
  end

  it { is_expected.to(have_many(:people).through(:organization_people)) }

  it "has a valid factory" do
    expect(build(:organization)).to(be_valid)
  end
end
