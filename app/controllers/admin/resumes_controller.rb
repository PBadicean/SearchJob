class Admin::ResumesController < Admin::BaseController

  def index
    @q = Resume.includes(:user).ransack(params[:q])
    @resumes = @q.result(distinct: true).page(params[:page])
  end

end
