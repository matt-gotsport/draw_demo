require 'test_helper'

class DrawStagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @draw_stage = draw_stages(:one)
  end

  test "should get index" do
    get draw_stages_url
    assert_response :success
  end

  test "should get new" do
    get new_draw_stage_url
    assert_response :success
  end

  test "should create draw_stage" do
    assert_difference('DrawStage.count') do
      post draw_stages_url, params: { draw_stage: { draw_stage_definition_id: @draw_stage.draw_stage_definition_id, draw_step_id: @draw_stage.draw_step_id, group_id: @draw_stage.group_id } }
    end

    assert_redirected_to draw_stage_url(DrawStage.last)
  end

  test "should show draw_stage" do
    get draw_stage_url(@draw_stage)
    assert_response :success
  end

  test "should get edit" do
    get edit_draw_stage_url(@draw_stage)
    assert_response :success
  end

  test "should update draw_stage" do
    patch draw_stage_url(@draw_stage), params: { draw_stage: { draw_stage_definition_id: @draw_stage.draw_stage_definition_id, draw_step_id: @draw_stage.draw_step_id, group_id: @draw_stage.group_id } }
    assert_redirected_to draw_stage_url(@draw_stage)
  end

  test "should destroy draw_stage" do
    assert_difference('DrawStage.count', -1) do
      delete draw_stage_url(@draw_stage)
    end

    assert_redirected_to draw_stages_url
  end
end
