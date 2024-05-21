require "application_system_test_case"

class EquationsTest < ApplicationSystemTestCase
  setup do
    @equation = equations(:one)
  end

  test "visiting the index" do
    visit equations_url
    assert_selector "h1", text: "Equations"
  end

  test "should create equation" do
    visit equations_url
    click_on "New equation"

    fill_in "Name", with: @equation.name
    fill_in "Resolution", with: @equation.resolution
    fill_in "Variable", with: @equation.variable_id
    click_on "Create Equation"

    assert_text "Equation was successfully created"
    click_on "Back"
  end

  test "should update Equation" do
    visit equation_url(@equation)
    click_on "Edit this equation", match: :first

    fill_in "Name", with: @equation.name
    fill_in "Resolution", with: @equation.resolution
    fill_in "Variable", with: @equation.variable_id
    click_on "Update Equation"

    assert_text "Equation was successfully updated"
    click_on "Back"
  end

  test "should destroy Equation" do
    visit equation_url(@equation)
    click_on "Destroy this equation", match: :first

    assert_text "Equation was successfully destroyed"
  end
end
