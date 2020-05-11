require "application_system_test_case"

class OutputGroupDefinitionsTest < ApplicationSystemTestCase
  setup do
    @output_group_definition = output_group_definitions(:one)
  end

  test "visiting the index" do
    visit output_group_definitions_url
    assert_selector "h1", text: "Output Group Definitions"
  end

  test "creating a Output group definition" do
    visit output_group_definitions_url
    click_on "New Output Group Definition"

    fill_in "Draw definition", with: @output_group_definition.draw_definition_id
    fill_in "Name", with: @output_group_definition.name
    fill_in "Sequence", with: @output_group_definition.sequence
    fill_in "Size", with: @output_group_definition.size
    click_on "Create Output group definition"

    assert_text "Output group definition was successfully created"
    click_on "Back"
  end

  test "updating a Output group definition" do
    visit output_group_definitions_url
    click_on "Edit", match: :first

    fill_in "Draw definition", with: @output_group_definition.draw_definition_id
    fill_in "Name", with: @output_group_definition.name
    fill_in "Sequence", with: @output_group_definition.sequence
    fill_in "Size", with: @output_group_definition.size
    click_on "Update Output group definition"

    assert_text "Output group definition was successfully updated"
    click_on "Back"
  end

  test "destroying a Output group definition" do
    visit output_group_definitions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Output group definition was successfully destroyed"
  end
end
