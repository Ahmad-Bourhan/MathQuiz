class QuizzesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_quiz, only: %i[ show edit update destroy ]
  before_action :authorize_owner!, only: [:edit, :update, :destroy]


  # GET /quizzes or /quizzes.json
  def index
    @quizzes = Quiz.all
  end

  # GET /quizzes/1 or /quizzes/1.json
  def show
  end

  # GET /quizzes/new
  def new
    @quiz = Quiz.new
  end

  # GET /quizzes/1/edit
  def edit
  end

  # POST /quizzes or /quizzes.json
  def create
    @quiz = Quiz.new(quiz_params)

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to @quiz, notice: "Quiz was successfully created." }
        format.json { render :show, status: :created, location: @quiz }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizzes/1 or /quizzes/1.json
  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to @quiz, notice: "Quiz was successfully updated." }
        format.json { render :show, status: :ok, location: @quiz }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/1 or /quizzes/1.json
  def destroy
    @quiz.destroy!

    respond_to do |format|
      format.html { redirect_to quizzes_path, status: :see_other, notice: "Quiz was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def check_quiz
    @quiz = Quiz.find(params[:id])
    user_answers = params[:answers] || {}
  
    correct_count = 0
  
    @quiz.questions.each do |question|
      user_answer = user_answers[question.id.to_s] 
      if user_answer.present? && user_answer.to_i == question.correct_answer.to_i
        correct_count += 1
        question.update(user_answer: user_answer, is_correct: true)
      else
        question.update(user_answer: user_answer, is_correct: false)
      end
    end
  
    @quiz.update(score: correct_count)
  
    redirect_to @quiz, notice: "You scored #{correct_count} out of #{@quiz.total_questions}!"
  end
  # Only allow a list of trusted parameters through.
  def quiz_params
    user_id = current_user&.id || raise("User must be logged in") 
    params.require(:quiz).permit(:operation, :difficulty, :total_questions).merge(user_id: user_id, score: 0)
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end
    def authorize_owner!
      unless @quiz.user_id == current_user.id
        redirect_to quizzes_path, alert: "You are not authorized to perform this action."
      end
    end
    
    
    
    
   
    
end
