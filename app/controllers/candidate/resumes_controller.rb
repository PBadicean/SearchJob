class Candidate::ResumesController < Candidate::BaseController

  before_action :set_candidate, only: :index
  before_action :set_resume, only: [:edit, :update]

  def new
    @resume = Resume.new
  end

  def index
    @resumes = @candidate.resumes
  end

  def create
    @resume = current_user.resumes.new(resume_params)
    if @resume.save
      flash[:notice] = t('messages.resumes.created')
      redirect_to candidate_resumes_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @resume.update(resume_params)
      flash[:notice] = t('messages.resumes.updated')
      redirect_to candidate_resumes_path
    else
      render :edit
    end
  end

  private

  def resume_params
    params.require(:resume).permit(
      :position, :salary, :category_id, :about_me, :tags,
      experiences_attributes: [:id, :_destroy, :date_start, :date_end, :duty, :company, :position]
    )
  end

  def set_resume
    @resume = Resume.find(params[:id])
  end

  def set_candidate
    @candidate = Candidate.find(current_user.id)
  end
end
