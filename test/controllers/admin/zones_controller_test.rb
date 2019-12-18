require 'test_helper'

class Admin::ZonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_zone = admin_zones(:one)
  end

  test "should get index" do
    get admin_zones_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_zone_url
    assert_response :success
  end

  test "should create admin_zone" do
    assert_difference('Admin::Zone.count') do
      post admin_zones_url, params: { admin_zone: { name: @admin_zone.name, person_overall_url: @admin_zone.person_overall_url, rep: @admin_zone.rep, team_overall_url: @admin_zone.team_overall_url, type: @admin_zone.type } }
    end

    assert_redirected_to admin_zone_url(Admin::Zone.last)
  end

  test "should show admin_zone" do
    get admin_zone_url(@admin_zone)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_zone_url(@admin_zone)
    assert_response :success
  end

  test "should update admin_zone" do
    patch admin_zone_url(@admin_zone), params: { admin_zone: { name: @admin_zone.name, person_overall_url: @admin_zone.person_overall_url, rep: @admin_zone.rep, team_overall_url: @admin_zone.team_overall_url, type: @admin_zone.type } }
    assert_redirected_to admin_zone_url(@admin_zone)
  end

  test "should destroy admin_zone" do
    assert_difference('Admin::Zone.count', -1) do
      delete admin_zone_url(@admin_zone)
    end

    assert_redirected_to admin_zones_url
  end
end
