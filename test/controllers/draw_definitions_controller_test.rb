require 'test_helper'

class DrawDefinitionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @draw_definition = draw_definitions(:one)
  end

  test "should get index" do
    get draw_definitions_url
    assert_response :success
  end

  test "should get new" do
    get new_draw_definition_url
    assert_response :success
  end

  test "should create draw_definition" do
    assert_difference('DrawDefinition.count') do
      post draw_definitions_url, params: { draw_definition: { name: @draw_definition.name } }
    end

    assert_redirected_to draw_definition_url(DrawDefinition.last)
  end

  test "should show draw_definition" do
    get draw_definition_url(@draw_definition)
    assert_response :success
  end

  test "should get edit" do
    get edit_draw_definition_url(@draw_definition)
    assert_response :success
  end

  test "should update draw_definition" do
    patch draw_definition_url(@draw_definition), params: { draw_definition: { name: @draw_definition.name } }
    assert_redirected_to draw_definition_url(@draw_definition)
  end

  test "should destroy draw_definition" do
    assert_difference('DrawDefinition.count', -1) do
      delete draw_definition_url(@draw_definition)
    end

    assert_redirected_to draw_definitions_url
  end
end
