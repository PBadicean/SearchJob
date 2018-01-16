class Candidate::ResumesController < Candidate::BaseController

  before_action :set_candidate, only: :index

  def new
    @resume = Resume.new
  end

  def index
    @resumes = @candidate.resumes
  end

  def create
    @resume = current_user.resumes.new(resume_params)
    if @resume.save
      redirect_to candidate_resumes_path
    else
      render :new
    end
  end

  def show
    @resume = Resume.find(params[:id])
  end

  private

  def resume_params
    params.require(:resume).permit(
      :position, :salary, :category_id, :about_me, :tags,
      experiences_attributes: [:date_start, :date_end, :duty, :company]
    )
  end

  def set_candidate
    @candidate = Candidate.find(current_user.id)
  end
end
