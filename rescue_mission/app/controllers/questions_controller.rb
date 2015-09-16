class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def new
  @question = Question.new

  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = 'Question added.'
      redirect_to '/questions'
    else
      flash[:alert] = @question.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
  @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      flash[:notice] = "Question Updated!"
      redirect_to question_path(@question)
    else
      flash[:alert] = @question.errors.full_messages.join(', ')
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = "Question Deleted"
    redirect_to '/questions'
  end

  protected

  def question_params
    params.require(:question).permit(:title, :description)
  end
#authenitaction devise gem

end
