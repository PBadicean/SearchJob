class Admin::Users::CandidatesController < Admin::BaseController

  before_action :set_candidate, only: [:edit, :update, :destroy]

  def index
    @q = Candidate.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page])
  end

  def new
    @candidate = Candidate.new
    @candidate.build_info
  end

  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
      flash[:notice] = t('messages.candidates.registred')
      redirect_to admin_users_candidates_path
    else
      render :new
    end
  end

  def update
    if @candidate.update(edit_candidate_params)
      flash[:notice] = t('messages.candidates.updated')
      redirect_to admin_users_candidates_path
    else
      render :edit
    end
  end

  def destroy
    @candidate.destroy
    flash[:notice] = t('messages.candidates.destroyed')
    redirect_to admin_users_candidates_path
  end

  private

  def set_candidate
    @candidate = Candidate.find(params[:id])
  end

  def candidate_params
    params.require(:candidate).permit :email, :name, :password, :password_confirmation,
                                      info_attributes: %i[place_id]
  end

  def edit_candidate_params
    return candidate_params.except(:password, :password_confirmation) if empty_password?
    candidate_params
  end

  def empty_password?
    candidate_params[:password].blank? || candidate_params[:password_confirmation].blank?
  end

end
