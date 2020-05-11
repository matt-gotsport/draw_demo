require "application_system_test_case"

class DrawRuleVarietiesTest < ApplicationSystemTestCase
  setup do
    @draw_rule_variety = draw_rule_varieties(:one)
  end

  test "visiting the index" do
    visit draw_rule_varieties_url
    assert_selector "h1", text: "Draw Rule Types"
  end

  test "creating a Draw rule type" do
    visit draw_rule_varieties_url
    click_on "New Draw Rule Type"

    fill_in "Description", with: @draw_rule_variety.description
    fill_in "Type", with: @draw_rule_variety.type
    click_on "Create Draw rule type"

    assert_text "Draw rule type was successfully created"
    click_on "Back"
  end

  test "updating a Draw rule type" do
    visit draw_rule_varieties_url
    click_on "Edit", match: :first

    fill_in "Description", with: @draw_rule_variety.description
    fill_in "Type", with: @draw_rule_variety.type
    click_on "Update Draw rule type"

    assert_text "Draw rule type was successfully updated"
    click_on "Back"
  end

  test "destroying a Draw rule type" do
    visit draw_rule_varieties_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Draw rule type was successfully destroyed"
  end
end
