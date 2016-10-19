require "rails_helper"

RSpec.feature "Fuel Stations Search by Zip Code", :type => :feature do
  scenario "User sees fuel stations when entering zip code" do
    # As a user
    # When I visit "/"
    visit '/'
    # And I fill in the search form with 80203
    fill_in "q", with: "80203"
    # And I click "Locate"
    click_on "Locate"
    # Then I should be on page "/search" with parameters visible in the url
    expect(page).to have_current_path(search_path(search: "80203"))
    # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
    expect(page).to have_content("Closest Stations: ")
    within(".stations") do
      expect(page).to have_content("")
    end
    # And the stations should be limited to Electric and Propane
    # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times

  end
end
