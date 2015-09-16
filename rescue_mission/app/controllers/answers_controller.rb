class AnswersController < ApplicationController
  def index
    @answers = Answers.all
  end

  # def show
  #   @answer = Answer.find_by(Question.find(params:id))
  # end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    if @answer.save
      flash[:notice] = "Answer added"
      redirect_to question_path(@question)
    else
      flash[:alert] = "Answer not long enough"
      render :'questions/show'
    end
  end


  private

  def answer_params
    params.require(:answer).permit(:description)
  end

end
