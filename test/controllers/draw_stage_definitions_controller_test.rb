require 'test_helper'

class DrawStageDefinitionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @draw_stage_definition = draw_stage_definitions(:one)
  end

  test "should get index" do
    get draw_stage_definitions_url
    assert_response :success
  end

  test "should get new" do
    get new_draw_stage_definition_url
    assert_response :success
  end

  test "should create draw_stage_definition" do
    assert_difference('DrawStageDefinition.count') do
      post draw_stage_definitions_url, params: { draw_stage_definition: { draw_definition_id: @draw_stage_definition.draw_definition_id, group_id: @draw_stage_definition.group_id, name: @draw_stage_definition.name } }
    end

    assert_redirected_to draw_stage_definition_url(DrawStageDefinition.last)
  end

  test "should show draw_stage_definition" do
    get draw_stage_definition_url(@draw_stage_definition)
    assert_response :success
  end

  test "should get edit" do
    get edit_draw_stage_definition_url(@draw_stage_definition)
    assert_response :success
  end

  test "should update draw_stage_definition" do
    patch draw_stage_definition_url(@draw_stage_definition), params: { draw_stage_definition: { draw_definition_id: @draw_stage_definition.draw_definition_id, group_id: @draw_stage_definition.group_id, name: @draw_stage_definition.name } }
    assert_redirected_to draw_stage_definition_url(@draw_stage_definition)
  end

  test "should destroy draw_stage_definition" do
    assert_difference('DrawStageDefinition.count', -1) do
      delete draw_stage_definition_url(@draw_stage_definition)
    end

    assert_redirected_to draw_stage_definitions_url
  end
end
