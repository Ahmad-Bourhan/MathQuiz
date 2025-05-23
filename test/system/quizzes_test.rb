require "application_system_test_case"

class QuizzesTest < ApplicationSystemTestCase
  setup do
    @quiz = quizzes(:one)
  end

  test "visiting the index" do
    visit quizzes_url
    assert_selector "h1", text: "Quizzes"
  end

  test "should create quiz" do
    visit quizzes_url
    click_on "New quiz"

    fill_in "Difficulty", with: @quiz.difficulty
    fill_in "Operation", with: @quiz.operation
    fill_in "Score", with: @quiz.score
    fill_in "Total questions", with: @quiz.total_questions
    fill_in "User", with: @quiz.user_id
    click_on "Create Quiz"

    assert_text "Quiz was successfully created"
    click_on "Back"
  end

  test "should update Quiz" do
    visit quiz_url(@quiz)
    click_on "Edit this quiz", match: :first

    fill_in "Difficulty", with: @quiz.difficulty
    fill_in "Operation", with: @quiz.operation
    fill_in "Score", with: @quiz.score
    fill_in "Total questions", with: @quiz.total_questions
    fill_in "User", with: @quiz.user_id
    click_on "Update Quiz"

    assert_text "Quiz was successfully updated"
    click_on "Back"
  end

  test "should destroy Quiz" do
    visit quiz_url(@quiz)
    click_on "Destroy this quiz", match: :first

    assert_text "Quiz was successfully destroyed"
  end
end
