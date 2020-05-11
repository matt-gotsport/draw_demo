require "application_system_test_case"

class DrawStageDefinitionsTest < ApplicationSystemTestCase
  setup do
    @draw_stage_definition = draw_stage_definitions(:one)
  end

  test "visiting the index" do
    visit draw_stage_definitions_url
    assert_selector "h1", text: "Draw Stage Definitions"
  end

  test "creating a Draw stage definition" do
    visit draw_stage_definitions_url
    click_on "New Draw Stage Definition"

    fill_in "Draw definition", with: @draw_stage_definition.draw_definition_id
    fill_in "Group", with: @draw_stage_definition.group_id
    fill_in "Name", with: @draw_stage_definition.name
    click_on "Create Draw stage definition"

    assert_text "Draw stage definition was successfully created"
    click_on "Back"
  end

  test "updating a Draw stage definition" do
    visit draw_stage_definitions_url
    click_on "Edit", match: :first

    fill_in "Draw definition", with: @draw_stage_definition.draw_definition_id
    fill_in "Group", with: @draw_stage_definition.group_id
    fill_in "Name", with: @draw_stage_definition.name
    click_on "Update Draw stage definition"

    assert_text "Draw stage definition was successfully updated"
    click_on "Back"
  end

  test "destroying a Draw stage definition" do
    visit draw_stage_definitions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Draw stage definition was successfully destroyed"
  end
end
