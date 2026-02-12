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
      expect(page).to have_button("🗑️ Delete")
    end

    within("#manage-organization-row-#{organization_b.id}") do
      expect(page).to have_content("Herders of Bashan")
      expect(page).to have_link("✍️ Edit")
      expect(page).to have_button("🗑️ Delete")
    end
  end

  scenario("Views People List", js: true) do
    person = create(:person, first_name: "Haggai")

    organization =
      create(:organization, name: "Minor Prophets", people: [person])

    visit manage_organizations_path

    within("#manage-organization-row-#{organization.id}") do
      click_link("People")
    end

    within("#organization-people-overlay") do
      expect(page).to have_content("People in Minor Prophets")
      expect(page).to have_content("Haggai")

      click_link("✖️")
    end

    expect(page).not_to have_content("People in Minor Prophets")
    expect(page).not_to have_content("Haggai")
  end

  scenario "Navigate to New Organization" do
    visit manage_organizations_url

    click_link("⛪ New Organization")

    expect(page.current_path).to eq(new_manage_organization_path)
  end

  scenario "Navigating to Edit Organization" do
    organization = create(:organization)

    visit manage_organizations_url

    click_link("Edit")

    expect(page.current_path).to eq(edit_manage_organization_path(organization))
  end

  scenario "Delete an Organization" do
    create(:organization, name: "Edomite Exalters")

    visit manage_organizations_url

    click_button("🗑️ Delete")

    expect(page).to have_content("Organization deleted successfully")
    expect(page).not_to have_content("Edomite Exalters")
  end
end
