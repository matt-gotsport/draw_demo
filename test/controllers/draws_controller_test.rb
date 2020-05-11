require 'test_helper'

class DrawsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @draw = draws(:one)
  end

  test "should get index" do
    get draws_url
    assert_response :success
  end

  test "should get new" do
    get new_draw_url
    assert_response :success
  end

  test "should create draw" do
    assert_difference('Draw.count') do
      post draws_url, params: { draw: { draw_definition_id: @draw.draw_definition_id, draw_stage_id: @draw.draw_stage_id } }
    end

    assert_redirected_to draw_url(Draw.last)
  end

  test "should show draw" do
    get draw_url(@draw)
    assert_response :success
  end

  test "should get edit" do
    get edit_draw_url(@draw)
    assert_response :success
  end

  test "should update draw" do
    patch draw_url(@draw), params: { draw: { draw_definition_id: @draw.draw_definition_id, draw_stage_id: @draw.draw_stage_id } }
    assert_redirected_to draw_url(@draw)
  end

  test "should destroy draw" do
    assert_difference('Draw.count', -1) do
      delete draw_url(@draw)
    end

    assert_redirected_to draws_url
  end
end
