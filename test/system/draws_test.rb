require "application_system_test_case"

class DrawsTest < ApplicationSystemTestCase
  setup do
    @draw = draws(:one)
  end

  test "visiting the index" do
    visit draws_url
    assert_selector "h1", text: "Draws"
  end

  test "creating a Draw" do
    visit draws_url
    click_on "New Draw"

    fill_in "Draw definition", with: @draw.draw_definition_id
    fill_in "Draw stage", with: @draw.draw_stage_id
    click_on "Create Draw"

    assert_text "Draw was successfully created"
    click_on "Back"
  end

  test "updating a Draw" do
    visit draws_url
    click_on "Edit", match: :first

    fill_in "Draw definition", with: @draw.draw_definition_id
    fill_in "Draw stage", with: @draw.draw_stage_id
    click_on "Update Draw"

    assert_text "Draw was successfully updated"
    click_on "Back"
  end

  test "destroying a Draw" do
    visit draws_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Draw was successfully destroyed"
  end
end
