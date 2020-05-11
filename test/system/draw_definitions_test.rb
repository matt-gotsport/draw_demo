require "application_system_test_case"

class DrawDefinitionsTest < ApplicationSystemTestCase
  setup do
    @draw_definition = draw_definitions(:one)
  end

  test "visiting the index" do
    visit draw_definitions_url
    assert_selector "h1", text: "Draw Definitions"
  end

  test "creating a Draw definition" do
    visit draw_definitions_url
    click_on "New Draw Definition"

    fill_in "Name", with: @draw_definition.name
    click_on "Create Draw definition"

    assert_text "Draw definition was successfully created"
    click_on "Back"
  end

  test "updating a Draw definition" do
    visit draw_definitions_url
    click_on "Edit", match: :first

    fill_in "Name", with: @draw_definition.name
    click_on "Update Draw definition"

    assert_text "Draw definition was successfully updated"
    click_on "Back"
  end

  test "destroying a Draw definition" do
    visit draw_definitions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Draw definition was successfully destroyed"
  end
end
