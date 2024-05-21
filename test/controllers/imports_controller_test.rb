require "test_helper"

class ImportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @import = imports(:one)
  end

  test "should get index" do
    get imports_url
    assert_response :success
  end

  test "should get new" do
    get new_import_url
    assert_response :success
  end

  test "should create import" do
    assert_difference("Import.count") do
      post imports_url, params: { import: { description: @import.description, import_at: @import.import_at, log: @import.log, status: @import.status } }
    end

    assert_redirected_to import_url(Import.last)
  end

  test "should show import" do
    get import_url(@import)
    assert_response :success
  end

  test "should get edit" do
    get edit_import_url(@import)
    assert_response :success
  end

  test "should update import" do
    patch import_url(@import), params: { import: { description: @import.description, import_at: @import.import_at, log: @import.log, status: @import.status } }
    assert_redirected_to import_url(@import)
  end

  test "should destroy import" do
    assert_difference("Import.count", -1) do
      delete import_url(@import)
    end

    assert_redirected_to imports_url
  end
end
