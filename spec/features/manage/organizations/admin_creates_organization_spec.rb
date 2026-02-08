require "rails_helper"

RSpec.feature("An Admin Views New Organization Page", type: :feature) do
  scenario "Creates an Organization with Success" do
    visit new_manage_organization_path

    fill_in("Name", with: "Prophets of the Promise")

    click_button("💾 Save")

    expect(page).to have_content("Organization created successfully")
  end

  scenario "Sees an Error when Creating an Organization Fails" do
    visit new_manage_organization_path

    fill_in("Name", with: "🧇")

    click_button("💾 Save")

    expect(page).to have_content("")
  end
end
