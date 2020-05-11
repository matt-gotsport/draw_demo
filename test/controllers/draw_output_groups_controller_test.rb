require 'test_helper'

class DrawOutputGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @draw_output_group = draw_output_groups(:one)
  end

  test "should get index" do
    get draw_output_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_draw_output_group_url
    assert_response :success
  end

  test "should create draw_output_group" do
    assert_difference('DrawOutputGroup.count') do
      post draw_output_groups_url, params: { draw_output_group: { size: @draw_output_group.size } }
    end

    assert_redirected_to draw_output_group_url(DrawOutputGroup.last)
  end

  test "should show draw_output_group" do
    get draw_output_group_url(@draw_output_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_draw_output_group_url(@draw_output_group)
    assert_response :success
  end

  test "should update draw_output_group" do
    patch draw_output_group_url(@draw_output_group), params: { draw_output_group: { size: @draw_output_group.size } }
    assert_redirected_to draw_output_group_url(@draw_output_group)
  end

  test "should destroy draw_output_group" do
    assert_difference('DrawOutputGroup.count', -1) do
      delete draw_output_group_url(@draw_output_group)
    end

    assert_redirected_to draw_output_groups_url
  end
end
