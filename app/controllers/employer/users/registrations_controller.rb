class Employer::Users::RegistrationsController < ApplicationController

  def index
    @employer = Employer.new
    @employer.build_info
  end

  def create
    @employer = Employer.new(employer_params)
    if @employer.save
      flash[:notice] = 'Вы успешно зарегестрировались, теперь войдите в ваш аккаунт'
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
