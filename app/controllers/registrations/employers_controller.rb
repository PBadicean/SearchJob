class Registrations::EmployersController < ActionController::Base

  layout 'application'

  def index
    @employer = Employer.new
    @employer.build_info
  end

  def create
    @employer = Employer.new(employer_params)
    if @employer.save
      flash[:notice] = t('devise.registrations.signed_up')
      redirect_to new_user_session_path
    else
      render :index
    end
  end

  private

  def employer_params
    params.require(:employer).permit(
      :email, :password, :password_confirmation,
      info_attributes: %i[company_name name]
    )
  end
end
