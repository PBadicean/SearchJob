class Admin::Users::AdminsController < Admin::BaseController

  before_action :set_admin, only: [:edit, :update, :destroy]

  def index
    @q = Admin.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page])
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.create(admin_params)
    if @admin.save
      flash[:notice] = t('messages.admins.registred')
      redirect_to admin_users_admins_path
    else
      render :new
    end
  end

  def update
    if @admin.update(edit_admin_params)
      flash[:notice] = t('messages.admins.updated')
      redirect_to admin_users_admins_path
    else
      render :edit
    end
  end

  def destroy
    @admin.destroy
    flash[:notice] = t('messages.admins.destroyed')
    redirect_to admin_users_admins_path
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(:name, :email, :password, :password_confirmation)
  end

  def edit_admin_params
    return admin_params.except(:password, :password_confirmation) if empty_password?
    admin_params
  end

  def empty_password?
    admin_params[:password].blank? || admin_params[:password_confirmation].blank?
  end

end
