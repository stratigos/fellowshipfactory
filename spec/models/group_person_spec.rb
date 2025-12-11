require "rails_helper"

RSpec.describe(GroupPerson, type: :model) do
  it do
    is_expected.to(belong_to(:group).inverse_of(:group_people))
  end

  it { is_expected.to(belong_to(:person).inverse_of(:group_people)) }

  it "has a valid factory" do
    expect(build(:group_person)).to(be_valid)
  end
end
