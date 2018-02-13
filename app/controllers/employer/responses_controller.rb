class Employer::ResponsesController < Employer::BaseController

  def index
    @responses = current_user.responses.page(params[:page])
  end

end
