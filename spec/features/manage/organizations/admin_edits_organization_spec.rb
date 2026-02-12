require "rails_helper"

RSpec.feature("An Admin Views Edit Organization Page", type: :feature) do
  scenario "Updates an Organization with success" do
    create(:person, last_name: "Fisherman", first_name: "Andrew")
    organization = create(:organization, name: "Discipled Discerners")

    visit edit_manage_organization_path(organization)

    fill_in("Name", with: "Discipled Discerners!")
    check("Fisherman, Andrew")

    click_button("💾 Save")

    expect(page).to have_content("Organization updated successfully")
  end

  scenario "Sees an error when updating an Organization fails" do
    organization = create(:organization, name: "Namers of the Name")

    visit edit_manage_organization_path(organization)

    fill_in("Name", with: "!?")

    click_button("💾 Save")

    expect(page).to(
      have_content("error prevented this organization from being saved")
    )
  end
end
