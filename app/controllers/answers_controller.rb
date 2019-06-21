class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question, only: [:new, :create]

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.new(answer_params.merge(user_id: current_user.id))
    if @answer.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:answer)
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

end
