require "rails_helper"

RSpec.describe(Manage::PresentPeople, type: :service) do
  describe ".call" do
    it "lists PersonPresenters for a list of People" do
      people = build_list(:person, 3)

      results = Manage::PresentPeople.call(people:)

      expect(results).to all(be_an_instance_of(Manage::PersonPresenter))
    end

    it "lists PersonPresenters sorted by #last_name" do
      middle_person = build(:person, last_name: "Habakkuk")
      last_person = build(:person, last_name: "Zechariah")
      first_person = build(:person, last_name: "Amos")
      people = [middle_person, last_person, first_person]

      presented_people = Manage::PresentPeople.call(people:)
      results = presented_people.map(&:last_name)

      expect(results).to eq(["Amos", "Habakkuk", "Zechariah"])
    end

    it "lists PersonPresenters for all People when args are empty" do
      create_list(:person, 3)

      people_presenters = Manage::PresentPeople.call
      result = people_presenters.length

      expect(result).to eq(3)
    end

    it "returns an empty array when there are no People" do
      result = Manage::PresentPeople.call

      expect(result).to eq([])
    end
  end
end
