require "rails_helper"

RSpec.feature("An Admin Views People Index Page", type: :feature) do
  scenario "Landing on People Index" do
    person_a = create(:person, first_name: "Jashobeam")
    person_b = create(:person, first_name: "Eleazar")

    visit manage_people_url

    expect(page).to have_content("Manage People")
    expect(page).to have_link("📈 New Person")

    within("#manage-person-row-#{person_a.id}") do
      expect(page).to have_content("Jashobeam")
      expect(page).to have_link("✍️ Edit")
      expect(page).to have_button("🗑️ Delete")
    end

    within("#manage-person-row-#{person_b.id}") do
      expect(page).to have_content("Eleazar")
      expect(page).to have_link("✍️ Edit")
      expect(page).to have_button("🗑️ Delete")
    end
  end

  scenario "Navigate to New Person" do
    visit manage_people_url

    click_link("New Person")

    expect(page.current_path).to eq(new_manage_person_path)
  end

  scenario "Navigating to Edit Person" do
    person = create(:person)

    visit manage_people_url

    click_link("Edit")

    expect(page.current_path).to eq(edit_manage_person_path(person))
  end

  scenario "Delete an Person" do
    create(:person, first_name: "Korah")

    visit manage_people_url

    click_button("Delete")

    expect(page).to have_content("Person deleted successfully")
    expect(page).not_to have_content("Korah")
  end
end
