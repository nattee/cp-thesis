require "application_system_test_case"

class CoefficientsTest < ApplicationSystemTestCase
  setup do
    @coefficient = coefficients(:one)
  end

  test "visiting the index" do
    visit coefficients_url
    assert_selector "h1", text: "Coefficients"
  end

  test "should create coefficient" do
    visit coefficients_url
    click_on "New coefficient"

    fill_in "Equation", with: @coefficient.equation_id
    fill_in "Timestep", with: @coefficient.timestep
    fill_in "Value", with: @coefficient.value
    fill_in "Variable", with: @coefficient.variable_id
    click_on "Create Coefficient"

    assert_text "Coefficient was successfully created"
    click_on "Back"
  end

  test "should update Coefficient" do
    visit coefficient_url(@coefficient)
    click_on "Edit this coefficient", match: :first

    fill_in "Equation", with: @coefficient.equation_id
    fill_in "Timestep", with: @coefficient.timestep
    fill_in "Value", with: @coefficient.value
    fill_in "Variable", with: @coefficient.variable_id
    click_on "Update Coefficient"

    assert_text "Coefficient was successfully updated"
    click_on "Back"
  end

  test "should destroy Coefficient" do
    visit coefficient_url(@coefficient)
    click_on "Destroy this coefficient", match: :first

    assert_text "Coefficient was successfully destroyed"
  end
end
