class Candidate::Responses::MessagesController < Candidate::BaseController

  before_action :set_response, only: [:create]

  def create
    @message = @response.messages.create(message_params.merge(user_id: current_user.id))
    redirect_to candidate_response_path(@response)
  end

  private

  def message_params
    params.require(:response_message).permit(:message_text)
  end

  def set_response
    @response = Response.find(params[:response_id])
  end

end
