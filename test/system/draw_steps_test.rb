require "application_system_test_case"

class DrawStepsTest < ApplicationSystemTestCase
  setup do
    @draw_step = draw_steps(:one)
  end

  test "visiting the index" do
    visit draw_steps_url
    assert_selector "h1", text: "Draw Steps"
  end

  test "creating a Draw step" do
    visit draw_steps_url
    click_on "New Draw Step"

    fill_in "Draw definition", with: @draw_step.draw_definition_id
    fill_in "Draw step type", with: @draw_step.draw_step_variety_id
    click_on "Create Draw step"

    assert_text "Draw step was successfully created"
    click_on "Back"
  end

  test "updating a Draw step" do
    visit draw_steps_url
    click_on "Edit", match: :first

    fill_in "Draw definition", with: @draw_step.draw_definition_id
    fill_in "Draw step type", with: @draw_step.draw_step_variety_id
    click_on "Update Draw step"

    assert_text "Draw step was successfully updated"
    click_on "Back"
  end

  test "destroying a Draw step" do
    visit draw_steps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Draw step was successfully destroyed"
  end
end
