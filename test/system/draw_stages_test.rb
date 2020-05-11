require "application_system_test_case"

class DrawStagesTest < ApplicationSystemTestCase
  setup do
    @draw_stage = draw_stages(:one)
  end

  test "visiting the index" do
    visit draw_stages_url
    assert_selector "h1", text: "Draw Stages"
  end

  test "creating a Draw stage" do
    visit draw_stages_url
    click_on "New Draw Stage"

    fill_in "Draw stage definition", with: @draw_stage.draw_stage_definition_id
    fill_in "Draw step", with: @draw_stage.draw_step_id
    fill_in "Group", with: @draw_stage.group_id
    click_on "Create Draw stage"

    assert_text "Draw stage was successfully created"
    click_on "Back"
  end

  test "updating a Draw stage" do
    visit draw_stages_url
    click_on "Edit", match: :first

    fill_in "Draw stage definition", with: @draw_stage.draw_stage_definition_id
    fill_in "Draw step", with: @draw_stage.draw_step_id
    fill_in "Group", with: @draw_stage.group_id
    click_on "Update Draw stage"

    assert_text "Draw stage was successfully updated"
    click_on "Back"
  end

  test "destroying a Draw stage" do
    visit draw_stages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Draw stage was successfully destroyed"
  end
end
