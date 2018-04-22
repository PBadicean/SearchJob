class Registrations::CandidatesController < ActionController::Base

  layout 'application'

  def index
    @candidate = Candidate.new
    @candidate.build_info
  end

  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
      flash[:notice] = t('devise.registrations.signed_up')
      redirect_to new_user_session_path
    else
      render :index
    end
  end

  private

  def candidate_params
    params.require(:candidate).permit(
      :email, :password, :password_confirmation, :name,
      info_attributes: %i[latitude longitude]
    )
  end

end
