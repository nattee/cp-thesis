require "application_system_test_case"

class ExamsTest < ApplicationSystemTestCase
  setup do
    @exam = exams(:one)
  end

  test "visiting the index" do
    visit exams_url
    assert_selector "h1", text: "Exams"
  end

  test "should create exam" do
    visit exams_url
    click_on "New exam"

    fill_in "Chair", with: @exam.chair
    fill_in "Com1", with: @exam.com1
    fill_in "Com2", with: @exam.com2
    fill_in "Com3", with: @exam.com3
    fill_in "Ex com", with: @exam.ex_com
    fill_in "Exam date", with: @exam.exam_date
    fill_in "Place", with: @exam.place
    fill_in "Proposal", with: @exam.proposal_id
    click_on "Create Exam"

    assert_text "Exam was successfully created"
    click_on "Back"
  end

  test "should update Exam" do
    visit exam_url(@exam)
    click_on "Edit this exam", match: :first

    fill_in "Chair", with: @exam.chair
    fill_in "Com1", with: @exam.com1
    fill_in "Com2", with: @exam.com2
    fill_in "Com3", with: @exam.com3
    fill_in "Ex com", with: @exam.ex_com
    fill_in "Exam date", with: @exam.exam_date
    fill_in "Place", with: @exam.place
    fill_in "Proposal", with: @exam.proposal_id
    click_on "Update Exam"

    assert_text "Exam was successfully updated"
    click_on "Back"
  end

  test "should destroy Exam" do
    visit exam_url(@exam)
    click_on "Destroy this exam", match: :first

    assert_text "Exam was successfully destroyed"
  end
end
