require "rails_helper"

RSpec.feature("An Admin Views Dashboards Page", type: :feature) do
  scenario "Landing on Dashboards Index" do
    visit manage_root_url

    expect(page).to have_content("Welcome to Fellowship Factory Management")
  end
end
