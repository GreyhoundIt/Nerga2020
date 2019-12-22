require "application_system_test_case"

class Admin::FixturesTest < ApplicationSystemTestCase
  setup do
    @admin_fixture = admin_fixtures(:one)
  end

  test "visiting the index" do
    visit admin_fixtures_url
    assert_selector "h1", text: "Admin/Fixtures"
  end

  test "creating a Fixture" do
    visit admin_fixtures_url
    click_on "New Admin/Fixture"

    fill_in "Bye teams", with: @admin_fixture.bye_teams
    fill_in "Home club", with: @admin_fixture.home_club
    fill_in "Person overall", with: @admin_fixture.person_overall
    fill_in "Start sheet official", with: @admin_fixture.start_sheet_official
    fill_in "Start sheet skeleton", with: @admin_fixture.start_sheet_skeleton
    fill_in "Team overall", with: @admin_fixture.team_overall
    fill_in "Zone", with: @admin_fixture.zone_id
    fill_in "Zone name", with: @admin_fixture.zone_name
    click_on "Create Fixture"

    assert_text "Fixture was successfully created"
    click_on "Back"
  end

  test "updating a Fixture" do
    visit admin_fixtures_url
    click_on "Edit", match: :first

    fill_in "Bye teams", with: @admin_fixture.bye_teams
    fill_in "Home club", with: @admin_fixture.home_club
    fill_in "Person overall", with: @admin_fixture.person_overall
    fill_in "Start sheet official", with: @admin_fixture.start_sheet_official
    fill_in "Start sheet skeleton", with: @admin_fixture.start_sheet_skeleton
    fill_in "Team overall", with: @admin_fixture.team_overall
    fill_in "Zone", with: @admin_fixture.zone_id
    fill_in "Zone name", with: @admin_fixture.zone_name
    click_on "Update Fixture"

    assert_text "Fixture was successfully updated"
    click_on "Back"
  end

  test "destroying a Fixture" do
    visit admin_fixtures_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fixture was successfully destroyed"
  end
end
