require "rails_helper"

RSpec.describe("some test", type: :service) do
  it "knows what arithmetic is" do
    number_a = 1
    number_b = 2

    result = number_a + number_b

    expect(result).to eq(3)
  end
end
