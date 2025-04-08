require "test_helper"

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quiz = quizzes(:one)
    @question = questions(:one)
    @user = users(:one)
    log_in_as(@user)
  end

  test "should get index" do
    get quiz_questions_url(@quiz)
    assert_response :success
  end

  test "should get new" do
    get new_quiz_question_url(@quiz)
    assert_response :success
  end

  test "should create question" do
    assert_difference("Question.count") do
      post quiz_questions_url(@quiz), params: {
        question: {
          correct_answer: @question.correct_answer,
          difficulty_level: @question.difficulty_level,
          mark: @question.mark,
          question_text: @question.question_text
        }
      }
    end

    assert_redirected_to quiz_question_url(@quiz, Question.last)
  end

  test "should show question" do
    get quiz_question_url(@quiz, @question)
    assert_response :success
  end

  test "should get edit" do
    get edit_quiz_question_url(@quiz, @question)
    assert_response :success
  end

  test "should update question" do
    patch quiz_question_url(@quiz, @question), params: {
      question: {
        correct_answer: @question.correct_answer,
        difficulty_level: @question.difficulty_level,
        mark: @question.mark,
        question_text: @question.question_text
      }
    }
    assert_redirected_to quiz_question_url(@quiz, @question)
  end

  test "should destroy question" do
    assert_difference("Question.count", -1) do
      delete quiz_question_url(@quiz, @question)
    end

    assert_redirected_to quiz_questions_url(@quiz)
  end
end
