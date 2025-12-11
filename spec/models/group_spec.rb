require "rails_helper"

RSpec.describe(Group, type: :model) do
  it { is_expected.to(belong_to(:organization).inverse_of(:groups)) }

  it do
    is_expected.to(
      have_many(:group_people)
      .dependent(:destroy)
      .inverse_of(:group)
    )
  end

  it { is_expected.to(have_many(:people).through(:group_people)) }

  it "has a valid factory" do
    expect(build(:group)).to(be_valid)
  end
end
