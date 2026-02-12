require "rails_helper"

RSpec.describe(Manage::PersonPresenter, type: :presenter) do
  describe "#<=>" do
    it "returns 1 when the #last_name is greater" do
      person_first = create(:person, last_name: "Alpheus")
      person_last = create(:person, last_name: "Zaccheus")
      presented_first = Manage::PersonPresenter.new(person_first)
      presented_last = Manage::PersonPresenter.new(person_last)

      result = presented_last.<=>(presented_first)

      expect(result).to eq(1)
    end

    it "returns -1 when the #last_name is lesser" do
      person_first = create(:person, last_name: "Aaron")
      person_last = create(:person, last_name: "Zadok")
      presented_first = Manage::PersonPresenter.new(person_first)
      presented_last = Manage::PersonPresenter.new(person_last)

      result = presented_first.<=>(presented_last)

      expect(result).to eq(-1)
    end

    it "returns 0 when the #last_name is the same" do
      person_first = create(:person, last_name: "Omega")
      person_same = create(:person, last_name: "Omega")
      presented_first = Manage::PersonPresenter.new(person_first)
      presented_same = Manage::PersonPresenter.new(person_same)

      result = presented_first.<=>(presented_same)

      expect(result).to eq(0)
    end
  end

  describe "#fname_lname" do
    it "returns a string with #first_name and #last_name" do
      person = create(:person, first_name: "Solomon", last_name: "son of David")
      presented_person = Manage::PersonPresenter.new(person)

      result = presented_person.fname_lname

      expect(result).to eq("Solomon son of David")
    end
  end

  describe "#lname_fname" do
    it "returns a string with #last_name, #first_name" do
      person = create(:person, first_name: "Simon", last_name: "Peter")
      presented_person = Manage::PersonPresenter.new(person)

      result = presented_person.lname_fname

      expect(result).to eq("Peter, Simon")
    end
  end
end
