require "application_system_test_case"

class DrawOutputGroupsTest < ApplicationSystemTestCase
  setup do
    @draw_output_group = draw_output_groups(:one)
  end

  test "visiting the index" do
    visit draw_output_groups_url
    assert_selector "h1", text: "Draw Output Groups"
  end

  test "creating a Draw output group" do
    visit draw_output_groups_url
    click_on "New Draw Output Group"

    fill_in "Size", with: @draw_output_group.size
    click_on "Create Draw output group"

    assert_text "Draw output group was successfully created"
    click_on "Back"
  end

  test "updating a Draw output group" do
    visit draw_output_groups_url
    click_on "Edit", match: :first

    fill_in "Size", with: @draw_output_group.size
    click_on "Update Draw output group"

    assert_text "Draw output group was successfully updated"
    click_on "Back"
  end

  test "destroying a Draw output group" do
    visit draw_output_groups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Draw output group was successfully destroyed"
  end
end
