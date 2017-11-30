class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
    @questions = Question.order("created_at DESC").all
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user

    if @question.save
      redirect_to @question
      flash[:notice] = "Question Submitted!"
    else
      flash[:notice] = @question.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
    authenticate_owner!(@question)
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)

    redirect_to @question
  end

  def destroy
      @question = Question.find(params[:id])
      @question.destroy
      redirect_to action: "index"
  end


  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
