class Admin::Users::AdminsController < Admin::BaseController
  def index
    @users = Admin.all
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.create(admin_params)
    if @admin.save
      flash[:notice] = t('admins.signed_up')
      redirect_to admin_users_admins_path
    else
      render :new
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :email, :password)
  end
end
