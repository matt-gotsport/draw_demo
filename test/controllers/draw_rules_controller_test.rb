require 'test_helper'

class DrawRulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @draw_rule = draw_rules(:one)
  end

  test "should get index" do
    get draw_rules_url
    assert_response :success
  end

  test "should get new" do
    get new_draw_rule_url
    assert_response :success
  end

  test "should create draw_rule" do
    assert_difference('DrawRule.count') do
      post draw_rules_url, params: { draw_rule: { draw_definition_id: @draw_rule.draw_definition_id, draw_rule_variety_id: @draw_rule.draw_rule_variety_id } }
    end

    assert_redirected_to draw_rule_url(DrawRule.last)
  end

  test "should show draw_rule" do
    get draw_rule_url(@draw_rule)
    assert_response :success
  end

  test "should get edit" do
    get edit_draw_rule_url(@draw_rule)
    assert_response :success
  end

  test "should update draw_rule" do
    patch draw_rule_url(@draw_rule), params: { draw_rule: { draw_definition_id: @draw_rule.draw_definition_id, draw_rule_variety_id: @draw_rule.draw_rule_variety_id } }
    assert_redirected_to draw_rule_url(@draw_rule)
  end

  test "should destroy draw_rule" do
    assert_difference('DrawRule.count', -1) do
      delete draw_rule_url(@draw_rule)
    end

    assert_redirected_to draw_rules_url
  end
end
