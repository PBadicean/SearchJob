class Candidate::ResponsesController < Candidate::BaseController

  def index
    @responses = current_user.responses.page(params[:page])
  end

end
