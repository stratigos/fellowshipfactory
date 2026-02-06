require "rails_helper"

RSpec.feature("An Admin Views Organizations Index Page", type: :feature) do
  scenario "Landing on Organizations Index" do
    organization_a = create(:organization, name: "Mighty Men of Manessah")
    organization_b = create(:organization, name: "Herders of Bashan")

    visit manage_organizations_url

    expect(page).to have_content("Manage Organizations")
    expect(page).to have_link("⛪ New Organization")

    within("#manage-organization-row-#{organization_a.id}") do
      expect(page).to have_content("Mighty Men of Manessah")
      expect(page).to have_link("✍️ Edit")
      expect(page).to have_link("🗑️ Delete")
    end

    within("#manage-organization-row-#{organization_b.id}") do
      expect(page).to have_content("Herders of Bashan")
      expect(page).to have_link("✍️ Edit")
      expect(page).to have_link("🗑️ Delete")
    end
  end
end
