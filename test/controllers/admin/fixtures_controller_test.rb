require 'test_helper'

class Admin::FixturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_fixture = admin_fixtures(:one)
  end

  test "should get index" do
    get admin_fixtures_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_fixture_url
    assert_response :success
  end

  test "should create admin_fixture" do
    assert_difference('Admin::Fixture.count') do
      post admin_fixtures_url, params: { admin_fixture: { bye_teams: @admin_fixture.bye_teams, home_club: @admin_fixture.home_club, person_overall: @admin_fixture.person_overall, start_sheet_official: @admin_fixture.start_sheet_official, start_sheet_skeleton: @admin_fixture.start_sheet_skeleton, team_overall: @admin_fixture.team_overall, zone_id: @admin_fixture.zone_id, zone_name: @admin_fixture.zone_name } }
    end

    assert_redirected_to admin_fixture_url(Admin::Fixture.last)
  end

  test "should show admin_fixture" do
    get admin_fixture_url(@admin_fixture)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_fixture_url(@admin_fixture)
    assert_response :success
  end

  test "should update admin_fixture" do
    patch admin_fixture_url(@admin_fixture), params: { admin_fixture: { bye_teams: @admin_fixture.bye_teams, home_club: @admin_fixture.home_club, person_overall: @admin_fixture.person_overall, start_sheet_official: @admin_fixture.start_sheet_official, start_sheet_skeleton: @admin_fixture.start_sheet_skeleton, team_overall: @admin_fixture.team_overall, zone_id: @admin_fixture.zone_id, zone_name: @admin_fixture.zone_name } }
    assert_redirected_to admin_fixture_url(@admin_fixture)
  end

  test "should destroy admin_fixture" do
    assert_difference('Admin::Fixture.count', -1) do
      delete admin_fixture_url(@admin_fixture)
    end

    assert_redirected_to admin_fixtures_url
  end
end
