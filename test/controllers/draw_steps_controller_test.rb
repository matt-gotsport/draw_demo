require 'test_helper'

class DrawStepsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @draw_step = draw_steps(:one)
  end

  test "should get index" do
    get draw_steps_url
    assert_response :success
  end

  test "should get new" do
    get new_draw_step_url
    assert_response :success
  end

  test "should create draw_step" do
    assert_difference('DrawStep.count') do
      post draw_steps_url, params: { draw_step: { draw_definition_id: @draw_step.draw_definition_id, draw_step_variety_id: @draw_step.draw_step_variety_id } }
    end

    assert_redirected_to draw_step_url(DrawStep.last)
  end

  test "should show draw_step" do
    get draw_step_url(@draw_step)
    assert_response :success
  end

  test "should get edit" do
    get edit_draw_step_url(@draw_step)
    assert_response :success
  end

  test "should update draw_step" do
    patch draw_step_url(@draw_step), params: { draw_step: { draw_definition_id: @draw_step.draw_definition_id, draw_step_variety_id: @draw_step.draw_step_variety_id } }
    assert_redirected_to draw_step_url(@draw_step)
  end

  test "should destroy draw_step" do
    assert_difference('DrawStep.count', -1) do
      delete draw_step_url(@draw_step)
    end

    assert_redirected_to draw_steps_url
  end
end
