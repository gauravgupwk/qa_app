class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @questions = current_user.questions
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @question = Question.includes(:answers).find(params[:id])
  end

  def edit
    @question = current_user.questions.find(params[:id])
  end

  def update
    @question = current_user.questions.find(params[:id])
    if @question.update(question_params)
      redirect_to questions_path
    else
      render :edit
    end
  end

  private

  def question_params
    params.require(:question).permit(:topic_id, :question)
  end
end
