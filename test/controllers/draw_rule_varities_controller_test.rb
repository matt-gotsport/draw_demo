require 'test_helper'

class DrawRuleVarietiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @draw_rule_variety = draw_rule_varieties(:one)
  end

  test "should get index" do
    get draw_rule_varieties_url
    assert_response :success
  end

  test "should get new" do
    get new_draw_rule_variety_url
    assert_response :success
  end

  test "should create draw_rule_variety" do
    assert_difference('DrawRuleVariety.count') do
      post draw_rule_varieties_url, params: { draw_rule_variety: { description: @draw_rule_variety.description, type: @draw_rule_variety.type } }
    end

    assert_redirected_to draw_rule_variety_url(DrawRuleVariety.last)
  end

  test "should show draw_rule_variety" do
    get draw_rule_variety_url(@draw_rule_variety)
    assert_response :success
  end

  test "should get edit" do
    get edit_draw_rule_variety_url(@draw_rule_variety)
    assert_response :success
  end

  test "should update draw_rule_variety" do
    patch draw_rule_variety_url(@draw_rule_variety), params: { draw_rule_variety: { description: @draw_rule_variety.description, type: @draw_rule_variety.type } }
    assert_redirected_to draw_rule_variety_url(@draw_rule_variety)
  end

  test "should destroy draw_rule_variety" do
    assert_difference('DrawRuleVariety.count', -1) do
      delete draw_rule_variety_url(@draw_rule_variety)
    end

    assert_redirected_to draw_rule_varieties_url
  end
end
