class ResponsesController < ApplicationController

  before_action :set_vacancy

  def create
    @response = @vacancy.responses.new(
      response_params.merge(candidate: current_user)
    )
    if @response.save
      flash[:notice] = t('messages.responses.created')
      @response.messages.create(message_text: @response.discription, user_id: current_user.id)
    end
    redirect_to vacancy_path(@vacancy)
  end

  private

  def set_vacancy
    @vacancy = Vacancy.find(params[:vacancy_id])
  end

  def response_params
    params.require(:response).permit(:discription)
  end

end
