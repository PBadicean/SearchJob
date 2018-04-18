module Messages

  extend ActiveSupport::Concern

  included do
    before_action :set_response, only: [:create]
  end

  def create
    @message = @response.messages.create(message_params.merge(user_id: current_user.id))
    redirect_to [current_user.role.to_sym, @response]
  end

  protected

  def message_params
    params.require(:response_message).permit(:message_text)
  end

  def set_response
    @response = Response.find(params[:response_id])
  end

end
