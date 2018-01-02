class Candidate::Users::RegistrationsController < ApplicationController

  def index
    @candidate = Candidate.new
    @candidate.build_info
  end

  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
      flash[:notice] = 'Вы успешно зарегестрировались, теперь войдите в ваш аккаунт'
      redirect_to new_user_session_path
    else
      render :index
    end
  end

  def candidate_params
    params.require(:candidate).permit(
      :email, :password, :password_confirmation,
      info_attributes: %i[place_id name]
    )
  end

end
