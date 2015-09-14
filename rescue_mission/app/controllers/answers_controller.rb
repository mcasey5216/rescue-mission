class AnswersController < ApplicationController
  def index
    @answers = Answers.all
  end

  # def show
  #   @answer = Answer.find_by(Question.find(params:id))
  # end

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    flash[:notice] = "Thanks for answering this question!"
  end


end
