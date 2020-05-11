require 'test_helper'

class DrawStepVarietiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @draw_step_variety = draw_step_varieties(:one)
  end

  test "should get index" do
    get draw_step_varieties_url
    assert_response :success
  end

  test "should get new" do
    get new_draw_step_variety_url
    assert_response :success
  end

  test "should create draw_step_variety" do
    assert_difference('DrawStepVariety.count') do
      post draw_step_varieties_url, params: { draw_step_variety: { description: @draw_step_variety.description, variety: @draw_step_variety.type } }
    end

    assert_redirected_to draw_step_variety_url(DrawStepVariety.last)
  end

  test "should show draw_step_variety" do
    get draw_step_variety_url(@draw_step_variety)
    assert_response :success
  end

  test "should get edit" do
    get edit_draw_step_variety_url(@draw_step_variety)
    assert_response :success
  end

  test "should update draw_step_variety" do
    patch draw_step_variety_url(@draw_step_variety), params: { draw_step_variety: { description: @draw_step_variety.description, type: @draw_step_variety.type } }
    assert_redirected_to draw_step_variety_url(@draw_step_variety)
  end

  test "should destroy draw_step_variety" do
    assert_difference('DrawStepVariety.count', -1) do
      delete draw_step_variety_url(@draw_step_variety)
    end

    assert_redirected_to draw_step_varieties_url
  end
end
