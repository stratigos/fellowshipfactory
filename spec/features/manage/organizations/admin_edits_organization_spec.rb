require "rails_helper"

RSpec.feature("An Admin Views New Organization Page", type: :feature) do
  scenario "Creates an Organization with Success" do
    organization = create(:organization, name: "Discipled Discerners")

    visit edit_manage_organization_path(organization)

    fill_in("Name", with: "Discipled Discerners!")

    click_button("💾 Save")

    expect(page).to have_content("Organization updated successfully")
  end

  scenario "Sees an Error when Creating an Organization Fails" do
    organization = create(:organization, name: "Namers of the Name")

    visit edit_manage_organization_path(organization)

    fill_in("Name", with: "!?")

    click_button("💾 Save")

    expect(page).to(
      have_content("error prevented this organization from being saved")
    )
  end
end
