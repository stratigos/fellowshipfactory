require "rails_helper"

RSpec.describe(Group, type: :model) do
  it { is_expected.to(belong_to(:organization).inverse_of(:groups)) }

  it "has a valid factory" do
    expect(build(:group)).to(be_valid)
  end
end
