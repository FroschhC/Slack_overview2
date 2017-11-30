class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.user = current_user
    @answer.question = @question

    if @answer.save
      redirect_to @question
      flash[:notice] = "Thanks for the response!"
    else
      redirect_to @question
      flash[:notice] = @answer.errors.full_messages.to_sentence
    end
  end


private

def answer_params
  params.require(:answer).permit(:body, :user_id)
end

end
