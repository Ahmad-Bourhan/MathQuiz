class QuestionsController < ApplicationController
  before_action :set_quiz
  before_action :set_question, only: %i[ show edit update destroy ]
  before_action :authorize_owner!, only: [:edit, :update, :destroy]


  def index
    @questions = @quiz.questions
  end

  def show
  end

  def new
    @question = @quiz.questions.new
  end

  def edit
  end

  def create
    @question = @quiz.questions.new(question_params)

    if @question.save
      redirect_to quiz_question_path(@quiz, @question), notice: "Question was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @question.update(question_params)
      redirect_to quiz_question_path(@quiz, @question), notice: "Question was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @question.destroy
    redirect_to quiz_questions_path(@quiz), notice: "Question was successfully destroyed.", status: :see_other
  end

  private

  def set_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end

  def set_question
    @question = @quiz.questions.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:question_text, :correct_answer, :difficulty_level, :mark)
  end
  def authorize_owner!
    unless @quiz.user_id == current_user.id
      redirect_to quizzes_path, alert: "You are not authorized to perform this action."
    end
  end
  
end
