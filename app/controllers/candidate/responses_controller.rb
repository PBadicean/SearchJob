class Candidate::ResponsesController < Candidate::BaseController

  before_action :load_response, only: [:show]

  def index
    @responses = current_user.responses.includes(:vacancy).page(params[:page])
  end

  def show
    @message = @response.messages.new
  end

  protected

  def load_response
    @response = Response.includes(messages: :user).find(params[:id])
  end

end
