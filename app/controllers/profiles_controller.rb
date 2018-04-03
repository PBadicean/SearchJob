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

  def set_user
    @user = current_user
    @user.build_info unless @user.admin?
  end

  def user_params
    params.require(current_user.role.to_sym).permit(
      :email, :avatar, :name, :birthday, :gender,
      info_attributes: %i[latitude longitude company_name]
    )
  end

end
