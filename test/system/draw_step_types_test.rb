require "application_system_test_case"

class DrawStepVarietiesTest < ApplicationSystemTestCase
  setup do
    @draw_step_variety = draw_step_varieties(:one)
  end

  test "visiting the index" do
    visit draw_step_varieties_url
    assert_selector "h1", text: "Draw Step Types"
  end

  test "creating a Draw step type" do
    visit draw_step_varieties_url
    click_on "New Draw Step Type"

    fill_in "Description", with: @draw_step_variety.description
    fill_in "Type", with: @draw_step_variety.type
    click_on "Create Draw step type"

    assert_text "Draw step type was successfully created"
    click_on "Back"
  end

  test "updating a Draw step type" do
    visit draw_step_varieties_url
    click_on "Edit", match: :first

    fill_in "Description", with: @draw_step_variety.description
    fill_in "Type", with: @draw_step_variety.type
    click_on "Update Draw step type"

    assert_text "Draw step type was successfully updated"
    click_on "Back"
  end

  test "destroying a Draw step type" do
    visit draw_step_varieties_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Draw step type was successfully destroyed"
  end
end
