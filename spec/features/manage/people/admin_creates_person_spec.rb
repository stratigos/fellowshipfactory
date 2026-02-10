require "rails_helper"

RSpec.feature("An Admin Views New Person Page", type: :feature) do
  scenario "Creates an Person with Success" do
    create(:organization, name: "The Zealous Ones")

    visit new_manage_person_path

    fill_in("First Name", with: "Judah")
    fill_in("Last name", with: "Maccabee")
    fill_in("Age", with: 33)
    fill_in("Email", with: "the-hammer@example.com")
    check("The Zealous Ones", unchecked: true)

    click_button("💾 Save")

    expect(page).to have_content("Person created successfully")
  end

  scenario "Sees an Error when Creating a Person Fails" do
    visit new_manage_person_path

    fill_in("First Name", with: "Baruch")
    fill_in("Last name", with: "the Scribe")
    fill_in("Age", with: 60)
    fill_in("Email", with: "📜")

    click_button("💾 Save")

    expect(page).to have_content(
      "1 error prevented this person from being saved"
    )

    expect(page).to have_content("Email is invalid")
  end
end
