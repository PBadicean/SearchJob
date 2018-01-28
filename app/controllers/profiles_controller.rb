class ProfilesController < ApplicationController

  before_action :set_user, only: [:edit, :update]

  def edit; end

  def update
    if @candidate.update(user_params)
      flash[:notice] = t('messages.profile.updated')
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def set_user
    @candidate = Candidate.find current_user.id
    @candidate.build_info
  end

  def user_params
    params.require(:candidate).permit(
      :email, :avatar, :name, :birthday, :gender,
      info_attributes: %i[place_id]
    )
  end

end
