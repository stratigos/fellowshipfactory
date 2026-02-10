require "rails_helper"

RSpec.feature("An Admin Views Edit Person Page", type: :feature) do
  scenario "Updates an Person with Success" do
    create(:organization, name: "The Shepherds")
    person = create(:person)

    visit edit_manage_person_path(person)

    fill_in("First Name", with: "David")
    fill_in("Last name", with: "Son of Jesse")
    fill_in("Age", with: 20)
    fill_in("Email", with: "slayer-of-tens-of-thousands@example.com")
    check("The Shepherds", unchecked: true)

    click_button("💾 Save")

    expect(page).to have_content("Person updated successfully")
  end

  scenario "Sees an Error when Updating an Person Fails" do
    person = create(:person)

    visit edit_manage_person_path(person)

    fill_in("First Name", with: "Enoch")
    fill_in("Last name", with: "the Scribe")
    fill_in("Age", with: 365)
    fill_in("Email", with: "them-watchers-be-wilin@example.com")

    click_button("💾 Save")

    expect(page).to(
      have_content("1 error prevented this person from being saved")
    )

    expect(page).to(have_content("Age must be less than 121"))
  end
end
