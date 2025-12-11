require "rails_helper"

RSpec.describe(OrganizationPerson, type: :model) do
  it do
    is_expected.to(belong_to(:organization).inverse_of(:organization_people))
  end

  it { is_expected.to(belong_to(:person).inverse_of(:organization_people)) }

  it "has a valid factory" do
    expect(build(:organization_person)).to(be_valid)
  end
end
