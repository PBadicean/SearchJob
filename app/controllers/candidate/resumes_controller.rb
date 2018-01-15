class Candidate::ResumesController < Candidate::BaseController

  before_action :set_candidate, only: :index

  def new
    @resume = Resume.new
    @resume.build_experience
  end

  def index
    @resumes = @candidate.resumes
  end

  def create
    @resume = Resume.new(resume_params.merge(user: current_user))
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
      :position, :salary, :category_id, :about_me,
      experience_attributes: %i[company duty date_start date_end]
    )
  end

  def set_candidate
    @candidate = Candidate.find(current_user)
  end
end