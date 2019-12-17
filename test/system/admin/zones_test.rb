require "application_system_test_case"

class Admin::ZonesTest < ApplicationSystemTestCase
  setup do
    @admin_zone = admin_zones(:one)
  end

  test "visiting the index" do
    visit admin_zones_url
    assert_selector "h1", text: "Admin/Zones"
  end

  test "creating a Zone" do
    visit admin_zones_url
    click_on "New Admin/Zone"

    fill_in "Name", with: @admin_zone.name
    fill_in "Person overall url", with: @admin_zone.person_overall_url
    fill_in "Rep", with: @admin_zone.rep
    fill_in "Team overall url", with: @admin_zone.team_overall_url
    fill_in "Type", with: @admin_zone.type
    click_on "Create Zone"

    assert_text "Zone was successfully created"
    click_on "Back"
  end

  test "updating a Zone" do
    visit admin_zones_url
    click_on "Edit", match: :first

    fill_in "Name", with: @admin_zone.name
    fill_in "Person overall url", with: @admin_zone.person_overall_url
    fill_in "Rep", with: @admin_zone.rep
    fill_in "Team overall url", with: @admin_zone.team_overall_url
    fill_in "Type", with: @admin_zone.type
    click_on "Update Zone"

    assert_text "Zone was successfully updated"
    click_on "Back"
  end

  test "destroying a Zone" do
    visit admin_zones_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Zone was successfully destroyed"
  end
end
