require "application_system_test_case"

class ImportsTest < ApplicationSystemTestCase
  setup do
    @import = imports(:one)
  end

  test "visiting the index" do
    visit imports_url
    assert_selector "h1", text: "Imports"
  end

  test "should create import" do
    visit imports_url
    click_on "New import"

    fill_in "Description", with: @import.description
    fill_in "Import at", with: @import.import_at
    fill_in "Log", with: @import.log
    fill_in "Status", with: @import.status
    click_on "Create Import"

    assert_text "Import was successfully created"
    click_on "Back"
  end

  test "should update Import" do
    visit import_url(@import)
    click_on "Edit this import", match: :first

    fill_in "Description", with: @import.description
    fill_in "Import at", with: @import.import_at
    fill_in "Log", with: @import.log
    fill_in "Status", with: @import.status
    click_on "Update Import"

    assert_text "Import was successfully updated"
    click_on "Back"
  end

  test "should destroy Import" do
    visit import_url(@import)
    click_on "Destroy this import", match: :first

    assert_text "Import was successfully destroyed"
  end
end
