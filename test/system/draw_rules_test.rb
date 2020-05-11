require "application_system_test_case"

class DrawRulesTest < ApplicationSystemTestCase
  setup do
    @draw_rule = draw_rules(:one)
  end

  test "visiting the index" do
    visit draw_rules_url
    assert_selector "h1", text: "Draw Rules"
  end

  test "creating a Draw rule" do
    visit draw_rules_url
    click_on "New Draw Rule"

    fill_in "Draw definition", with: @draw_rule.draw_definition_id
    fill_in "Draw rule type", with: @draw_rule.draw_rule_variety_id
    click_on "Create Draw rule"

    assert_text "Draw rule was successfully created"
    click_on "Back"
  end

  test "updating a Draw rule" do
    visit draw_rules_url
    click_on "Edit", match: :first

    fill_in "Draw definition", with: @draw_rule.draw_definition_id
    fill_in "Draw rule type", with: @draw_rule.draw_rule_variety_id
    click_on "Update Draw rule"

    assert_text "Draw rule was successfully updated"
    click_on "Back"
  end

  test "destroying a Draw rule" do
    visit draw_rules_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Draw rule was successfully destroyed"
  end
end
