require 'test_helper'

class OutputGroupDefinitionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @output_group_definition = output_group_definitions(:one)
  end

  test "should get index" do
    get output_group_definitions_url
    assert_response :success
  end

  test "should get new" do
    get new_output_group_definition_url
    assert_response :success
  end

  test "should create output_group_definition" do
    assert_difference('OutputGroupDefinition.count') do
      post output_group_definitions_url, params: { output_group_definition: { draw_definition_id: @output_group_definition.draw_definition_id, name: @output_group_definition.name, sequence: @output_group_definition.sequence, size: @output_group_definition.size } }
    end

    assert_redirected_to output_group_definition_url(OutputGroupDefinition.last)
  end

  test "should show output_group_definition" do
    get output_group_definition_url(@output_group_definition)
    assert_response :success
  end

  test "should get edit" do
    get edit_output_group_definition_url(@output_group_definition)
    assert_response :success
  end

  test "should update output_group_definition" do
    patch output_group_definition_url(@output_group_definition), params: { output_group_definition: { draw_definition_id: @output_group_definition.draw_definition_id, name: @output_group_definition.name, sequence: @output_group_definition.sequence, size: @output_group_definition.size } }
    assert_redirected_to output_group_definition_url(@output_group_definition)
  end

  test "should destroy output_group_definition" do
    assert_difference('OutputGroupDefinition.count', -1) do
      delete output_group_definition_url(@output_group_definition)
    end

    assert_redirected_to output_group_definitions_url
  end
end
