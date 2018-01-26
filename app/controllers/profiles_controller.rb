class ProfilesController < ApplicationController

  before_action :set_user, only: [:edit, :update]

  def edit; end

  def update
    if @user.update(user_params)
      flash[:notice] = t('messages.profile.updated')
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def set_model
    @model = Profile
  end

  def set_user
    @user = Profile.find current_user.id
  end

  def user_params
    params.require(:profile).permit :name, :avatar, :gender,
                                    :birthday, :email, :password,
                                    :password_confirmation
  end

end
