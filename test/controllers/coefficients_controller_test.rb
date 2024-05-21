require "test_helper"

class CoefficientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coefficient = coefficients(:one)
  end

  test "should get index" do
    get coefficients_url
    assert_response :success
  end

  test "should get new" do
    get new_coefficient_url
    assert_response :success
  end

  test "should create coefficient" do
    assert_difference("Coefficient.count") do
      post coefficients_url, params: { coefficient: { equation_id: @coefficient.equation_id, timestep: @coefficient.timestep, value: @coefficient.value, variable_id: @coefficient.variable_id } }
    end

    assert_redirected_to coefficient_url(Coefficient.last)
  end

  test "should show coefficient" do
    get coefficient_url(@coefficient)
    assert_response :success
  end

  test "should get edit" do
    get edit_coefficient_url(@coefficient)
    assert_response :success
  end

  test "should update coefficient" do
    patch coefficient_url(@coefficient), params: { coefficient: { equation_id: @coefficient.equation_id, timestep: @coefficient.timestep, value: @coefficient.value, variable_id: @coefficient.variable_id } }
    assert_redirected_to coefficient_url(@coefficient)
  end

  test "should destroy coefficient" do
    assert_difference("Coefficient.count", -1) do
      delete coefficient_url(@coefficient)
    end

    assert_redirected_to coefficients_url
  end
end
