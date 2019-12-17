require "application_system_test_case"

class Admin::ClubsTest < ApplicationSystemTestCase
  setup do
    @admin_club = admin_clubs(:one)
  end

  test "visiting the index" do
    visit admin_clubs_url
    assert_selector "h1", text: "Admin/Clubs"
  end

  test "creating a Club" do
    visit admin_clubs_url
    click_on "New Admin/Club"

    fill_in "Name", with: @admin_club.name
    fill_in "Postcode", with: @admin_club.postcode
    fill_in "Website", with: @admin_club.website
    click_on "Create Club"

    assert_text "Club was successfully created"
    click_on "Back"
  end

  test "updating a Club" do
    visit admin_clubs_url
    click_on "Edit", match: :first

    fill_in "Name", with: @admin_club.name
    fill_in "Postcode", with: @admin_club.postcode
    fill_in "Website", with: @admin_club.website
    click_on "Update Club"

    assert_text "Club was successfully updated"
    click_on "Back"
  end

  test "destroying a Club" do
    visit admin_clubs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Club was successfully destroyed"
  end
end
